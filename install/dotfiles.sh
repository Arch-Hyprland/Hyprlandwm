#!/bin/bash
dot_folder="dotfiles"
dot_files_update=1
echo -e "${GREEN}"
figlet "Folder"
echo -e "${NONE}"

_define_dotfiles_folder() {
    echo ":: The ML4W Dotfiles will be installed in ~/$dot_folder"
    echo ":: You can change the folder name if required (please avoid spaces)"
    echo
    dot_folder_tmp=$(gum input --value "$dot_folder" --placeholder "Enter your installation folder name")
    dot_folder=${dot_folder_tmp//[[:blank:]]/}
    if [ ! -z $dot_folder ] ;then
        _confirm_dotfiles_folder
    else
        echo "ERROR: Please define a folder name"
        _define_dotfiles_folder
    fi
}

_confirm_dotfiles_folder() {
    echo ":: The ML4W Dotfiles will be installed in ~/$dot_folder"
    if [ -d ~/$dot_folder ] ;then
        echo ":: The folder ~/$dot_folder already exists and the files will be updated."
    fi
    echo
    if gum confirm "Do you want use this folder?" ;then
        echo ":: ML4W Dotfiles will be installed in ~/$dot_folder"
    elif [ $? -eq 130 ]; then
        echo ":: Installation canceled."
        exit 130
    else
        _define_dotfiles_folder
    fi
}

if [ -f ~/.config/ml4w/settings/dotfiles-folder.sh ] ;then
    echo ":: An existing ML4W Dotfiles folder has been detected: ~/$(cat ~/.config/ml4w/settings/dotfiles-folder.sh)"
    echo ":: You can update your existing ML4W Dotfiles in $(cat ~/.config/ml4w/settings/dotfiles-folder.sh) or install in a new folder."
    echo
    if gum confirm "Do you want to start the update in $(cat ~/.config/ml4w/settings/dotfiles-folder.sh)"; then
        dot_folder=$(cat ~/.config/ml4w/settings/dotfiles-folder.sh)
        dot_files_update=0
    elif [ $? -eq 130 ]; then
        echo ":: Installation canceled."
        exit 130
    fi
fi

if [ $dot_files_update == "0" ] ;then
    echo ":: Update will be executed in ~/$dot_folder"
    echo
else
    _confirm_dotfiles_folder
fi
