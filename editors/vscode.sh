# A script to autome vs code extension install
EXTENSIONS_TO_INSTALL=(
    'alefragnani.project-manager'
    'monokai.theme-monokai-pro-vscode'
    'ms-vscode-remote.remote-containers'
    'sleistner.vscode-fileutils'
    'ue.alphabetical-sorter'
)

for extension in ${EXTENSIONS_TO_INSTALL[@]}; do
    # Using --force to prevent a stopping action when finding duplicated extensions
    code --install-extension $extension --force
done

SETTINGS_PATH=~/.config/Code/User/settings.json

# Remove the original (empty) settings file and copy the new settings file 
rm $SETTINGS_PATH && cp ./settings.json $SETTINGS_PATH
