#!/bin/bash
clear

repo="mylinuxforwork/dotfiles"

# Get latest tag from GitHub
get_latest_release() {
  curl --silent "https://api.github.com/repos/$repo/releases/latest" | # Get latest release from GitHub api
    grep '"tag_name":' |                                            # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/'                                    # Pluck JSON value
}

# Get latest zip from GitHub
get_latest_zip() {
  curl --silent "https://api.github.com/repos/$repo/releases/latest" | # Get latest release from GitHub api
    grep '"zipball_url":' |                                            # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/'                                    # Pluck JSON value
}

# Check if package is installed
_isInstalled() {
    package="$1";
    check="$(sudo pacman -Qs --color always "${package}" | grep "local" | grep "${package} ")";
    if [ -n "${check}" ] ; then
        echo 0; #'0' means 'true' in Bash
        return; #true
    fi;
    echo 1; #'1' means 'false' in Bash
    return; #false
}

# Install required packages
_installPackages() {
    toInstall=();
    for pkg; do
        if [[ $(_isInstalled "${pkg}") == 0 ]]; then
            echo ":: ${pkg} is already installed.";
            continue;
        fi;
        toInstall+=("${pkg}");
    done;
    if [[ "${toInstall[@]}" == "" ]]; then
        # echo "All pacman packages are already installed.";
        return;
    fi;
    printf "Package not installed:\n%s\n" "${toInstall[@]}";
    sudo pacman --noconfirm -S "${toInstall[@]}";
}

# Required packages for the installer
packages=(
    "wget"
    "unzip"
    "gum"
    "rsync"
    "git"
)

latest_version=$(get_latest_release)

# Some colors
GREEN='\033[0;32m'
NONE='\033[0m'

# Header
echo -e "${GREEN}"
cat <<"EOF"
   ____         __       ____       
  /  _/__  ___ / /____ _/ / /__ ____
 _/ // _ \(_-</ __/ _ `/ / / -_) __/
/___/_//_/___/\__/\_,_/_/_/\__/_/   
                                    
EOF
echo "ML4W Dotfiles for Hyprland"
echo -e "${NONE}"
while true; do
    read -p "DO YOU WANT TO START THE INSTALLATION NOW? (Yy/Nn): " yn
    case $yn in
        [Yy]* )
            echo ":: Installation started."
            echo
        break;;
        [Nn]* ) 
            echo ":: Installation canceled"
            exit;
        break;;
        * ) 
            echo ":: Please answer yes or no."
        ;;
    esac
done

# Create Downloads folder if not exists
if [ ! -d ~/Downloads ]; then
    mkdir ~/Downloads
    echo ":: Downloads folder created"
fi 

# Remove existing download folder and zip files 
if [ -f $HOME/Downloads/dotfiles-main.zip ]; then
    rm $HOME/Downloads/dotfiles-main.zip
fi
if [ -f $HOME/Downloads/dotfiles-dev.zip ]; then
    rm $HOME/Downloads/dotfiles-dev.zip
fi
if [ -f $HOME/Downloads/dotfiles.zip ]; then
    rm $HOME/Downloads/dotfiles.zip
fi
if [ -d $HOME/Downloads/dotfiles ]; then
    rm -rf $HOME/Downloads/dotfiles
fi
if [ -d $HOME/Downloads/dotfiles_temp ]; then
    rm -rf $HOME/Downloads/dotfiles_temp
fi
if [ -d $HOME/Downloads/dotfiles-main ]; then
    rm -rf $HOME/Downloads/dotfiles-main
fi
if [ -d $HOME/Downloads/dotfiles-dev ]; then
    rm -rf $HOME/Downloads/dotfiles-dev
fi

# Synchronizing package databases
sudo pacman -Sy
echo

# Install required packages
echo ":: Checking that required packages are installed..."
_installPackages "${packages[@]}";
echo
# Select the dotfiles version
echo "Please choose between: "
echo "- ML4W Dotfiles for Hyprland $latest_version (latest stable release)"
echo "- ML4W Dotfiles for Hyprland Rolling Release (main branch including the latest commits)"
echo
version=$(gum choose "main-release" "rolling-release" "CANCEL")
if [ "$version" == "main-release" ]; then
    echo ":: Installing Main Release"
    yay -S --noconfirm ml4w-hyprland
elif [ "$version" == "rolling-release" ]; then
    echo ":: Installing Rolling Release"
    yay -S ml4w-hyprland-git
elif [ "$version" == "CANCEL" ]; then
    echo ":: Setup canceled"
    exit 130    
else
    echo ":: Setup canceled"
    exit 130
fi
echo ":: Installation complete."
echo
# Start Spinner
gum spin --spinner dot --title "Starting setup now..." -- sleep 3

# Start setup
ml4w-hyprland-setup -p arch