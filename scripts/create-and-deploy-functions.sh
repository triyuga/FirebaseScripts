# Create and deploy Functions app to Firebase

# Run from root with:
# ./scripts/create-and-deploy-functions.sh

# Make executable from root with:
# chmod u+x scripts/create-and-deploy-react-app.sh

SANDBOX_DIR="sandbox"
FUNCTIONS_DIR="functions"

mkdir -p $SANDBOX_DIR

(
    cd $SANDBOX_DIR
    if [ ! -d $FUNCTIONS_DIR ]; then
        # create my-functions, if not exists
        firebase init functions
        cp -fr ../templates/functions/index.ts ./functions/src/index.ts
    fi
)

./scripts/install-firebase-tools-and-login.sh

(
    cd $SANDBOX_DIR

    # if file "firebase.json" doesn't exists, or doesn't contain "functions" section...
    if [ ! -f "firebase.json" ] || ! grep -q "functions" "firebase.json"; then 
        firebase init functions
        # === Wizard: firebase init functions
    fi

    firebase deploy --only functions
)


