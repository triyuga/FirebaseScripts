# Demonstrate Firebase Emulators

# Run with:
# ./scripts/start-emulators.sh

# Make executable:
# chmod u+x scripts/start-emulators.sh

SANDBOX_DIR="sandbox"
APP_DIR="app"

./scripts/install-firebase-tools-and-login.sh
./scripts/kill-emulators.sh

(
    cd $SANDBOX_DIR

    # if app dir exists, build the app
    if [ -d $APP_DIR ]; then
        (
            cd $APP_DIR
            npm run build
        )
    fi

    # if file "firebase.json" doesn't exists, or doesn't contain "emulators" section...
    if [ ! -f "firebase.json" ] || ! grep -q "emulators" "firebase.json"; then
        firebase init emulators
        # === Wizard: firebase init emulators
        # ? Which Firebase emulators do you want to set up? Press Space to select emulators, then Enter to confirm your choices. Functions Emulator, Firestore Emulator, Hosting Emulator
        # ? Which port do you want to use for the functions emulator? 5001
        # ? Which port do you want to use for the firestore emulator? 8080
        # ? Which port do you want to use for the hosting emulator? 3001
        # ? Would you like to enable the Emulator UI? Yes
        # ? Which port do you want to use for the Emulator UI (leave empty to use any available port)? 
        # ? Would you like to download the emulators now? Yes
    fi

    firebase emulators:start
)

