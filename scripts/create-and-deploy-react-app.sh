# Create and deploy a React App to Firebase

# Run from root with:
# ./scripts/create-and-deploy-react-app.sh

# Make executable from root with:
# chmod u+x scripts/create-and-deploy-react-app.sh

SANDBOX_DIR="sandbox"
APP_DIR="app"

mkdir -p $SANDBOX_DIR

(
    cd $SANDBOX_DIR
    if [ ! -d $APP_DIR ]; then
        # create-react-app, if not exists
        npx create-react-app $APP_DIR --template typescript
    fi
    (
        cd $APP_DIR
        # npm run start
        npm run build
    )
)

./scripts/install-firebase-tools-and-login.sh

(
    cd $SANDBOX_DIR
    
    # if file "firebase.json" doesn't exists, or doesn't contain "hosting" section...
    if [ ! -f "firebase.json" ] || ! grep -q "hosting" "firebase.json"; then
        firebase init hosting
        # === Wizard: firebase init hosting
        # ? What do you want to use as your public directory? app/build
        # ? Configure as a single-page app (rewrite all urls to /index.html)? Yes
        # ? Set up automatic builds and deploys with GitHub? No
        # ? File app/build/index.html already exists. Overwrite? No
    fi

    firebase deploy --only hosting
)