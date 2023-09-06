// This example is from https://firebase.google.com/docs/functions/get-started?gen=2nd
// It has been converted to Typescript

// The Cloud Functions for Firebase SDK to create Cloud Functions and triggers.
import { onRequest, Request } from 'firebase-functions/v2/https'
import { Response } from 'firebase-functions/v1'
import * as logger from 'firebase-functions/logger'
import { onDocumentCreated } from 'firebase-functions/v2/firestore'

// The Firebase Admin SDK to access Firestore.
import { initializeApp } from 'firebase-admin/app'
import { getFirestore } from 'firebase-admin/firestore'

initializeApp()

// Start writing functions
// https://firebase.google.com/docs/functions/typescript

export const helloWorld = onRequest((request: Request, response: Response) => {
    logger.info('Hello logs!', { structuredData: true })
    console.log('request', request)
    response.send('Hello from Firebase!')
})

// Take the text parameter passed to this HTTP endpoint and insert it into
// Firestore under the path /messages/:documentId/original
export const addMessage = onRequest(async (req, res) => {
    // Grab the text parameter.
    const original = req.query.text
    // Push the new message into Firestore using the Firebase Admin SDK.
    const writeResult = await getFirestore().collection('messages').add({ original: original })
    // Send back a message that we've successfully written the message
    res.json({ result: `Message with ID: ${writeResult.id} added.` })
})

// Listens for new messages added to /messages/:documentId/original
// and saves an uppercased version of the message
// to /messages/:documentId/uppercase
export const makeUppercase = onDocumentCreated('/messages/{documentId}', event => {
    // Grab the current value of what was written to Firestore.
    const original = event.data?.data().text

    // Access the parameter `{documentId}` with `event.params`
    logger.log('makeUppercase', event.params.documentId, original)

    const uppercaseText = original.toUpperCase()

    // You must return a Promise when performing
    // asynchronous tasks inside a function
    // such as writing to Firestore.
    // Setting an 'uppercase' field in Firestore document returns a Promise.
    return event.data?.ref.set({ uppercaseText }, { merge: true })
})
