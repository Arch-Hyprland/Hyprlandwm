# ------------------------------------------------------
# Required packages
# ------------------------------------------------------
_writeLogHeader "Required packages"

# Required packages for the installer
source $packages_directory/$install_platform/installer.sh

# Install required packages
_writeMessage "Checking required packages for the installer..."
_installPackages "${packages[@]}";
echo