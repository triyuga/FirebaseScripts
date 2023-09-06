if [[ ! $(npm list -g | grep firebase-tools) ]]; then
    # install firebase-tools, if not installed
    echo "Installing firebase-tools"
    npm install -g firebase-tools
fi

echo "Using firebase-tools version" $(firebase --version)

firebase login