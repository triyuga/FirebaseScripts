# Demonstrate Firebase Emulators

# Run with:
# ./emulators.sh

# Make executable:
# chmod u+x emulators.sh

./create-and-deploy-react-app.sh

cd sandbox/my-app

if ! grep -q "emulators" "firebase.json"; then
    firebase init emulators
    # === Emulators Setup
    # ? Which Firebase emulators do you want to set up? Press Space to select emulators, then Enter to confirm your choices. Hosting Emulator
    # ? Which port do you want to use for the hosting emulator? 3000
    # ? Would you like to enable the Emulator UI? Yes
    # ? Which port do you want to use for the Emulator UI (leave empty to use any available port)? 
    # ? Would you like to download the emulators now? Yes
fi

firebase emulators:start
