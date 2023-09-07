lsof -ti tcp:9099 | xargs kill -9 # auth
lsof -ti tcp:5001 | xargs kill -9 # functions
lsof -ti tcp:8080 | xargs kill -9 # firestore
lsof -ti tcp:3001 | xargs kill -9 # hosting
lsof -ti tcp:8085 | xargs kill -9 # pubsub
lsof -ti tcp:9199 | xargs kill -9 # storage