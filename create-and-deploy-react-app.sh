# Create and deploy a React App to Firebase

# Run with:
# ./create-and-deploy-react-app.sh

# Make executable:
# chmod u+x create-and-deploy-react-app.sh

mkdir -p sandbox

cd sandbox

if [ ! -d "my-app" ]; then
    # create my-app, if not exists
    npx create-react-app my-app --template typescript
fi

cd my-app

# npm start

npm run build

if [[ ! $(npm list -g | grep firebase-tools) ]]; then
    # install firebase-tools, if not installed
    echo "Installing firebase-tools"
    npm install -g firebase-tools
fi

echo "Using firebase-tools version" $(firebase --version)

firebase login

if [ ! -f "firebase.json" ]; then # if file "firebase.json" not exists, initialise firebase
    firebase init
    # === Firebase Init Wizard
    # ? Select a default Firebase project for this directory:
    # -> Create project OR Use exisiting project
    # ? Which Firebase features do you want to set up for this directory? Press Space to select features, then Enter to confirm your choices. 
    # -> Hosting: Configure files for Firebase Hosting and (optionally) set up GitHub Action deploys
    # ? What do you want to use as your public directory? 
    # -> build
    # ? Configure as a single-page app (rewrite all urls to /index.html)?
    # -> Yes
    # ? Set up automatic builds and deploys with GitHub?
    # -> No
    # ? File build/index.html already exists. Overwrite? 
    # -> No
fi

firebase deploy