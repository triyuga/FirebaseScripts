# Create and deploy a React App to Firebase

# Run with:
# ./create-and-deploy-react-app.sh

# Make executable:
# chmod x create-and-deploy-react-app.sh

mkdir -p sandbox
cd sandbox
[ ! -d "my-app" ] && npx create-react-app my-app --template typescript # create my-app, if not exists
cd my-app
# npm start
npm run build
npm list -g | grep firebase-tools || npm install -g firebase-tools # install firebase-tools, if not installed
firebase login
[ ! -f "firebase.json" ] && firebase init # initialize firebase, if firebase.json not exists
# Firebase init wizard options:
# - Which Firebase features do you want to set up for this directory?
#   - Hosting: Configure files for Firebase Hosting and (optionally) set up GitHub Action deploys
# - Please select an option: (Use arrow keys)
#   - Create a new project OR Use an existing project
# - What do you want to use as your public directory?
#   - build
# - Configure as a single-page app (rewrite all urls to /index.html)?
#   - y
# - Configure as a single-page app (rewrite all urls to /index.html)?
#   - y
# - Set up automatic builds and deploys with GitHub?
#   - n
# - File build/index.html already exists. Overwrite?
#   - n
firebase deploy