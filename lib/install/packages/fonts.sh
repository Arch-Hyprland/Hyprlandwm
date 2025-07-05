#!/bin/bash

# Check if the JetBrainsMono folder exists
if [ -d ~/.local/share/fonts/JetBrainsMonoNerd ]; then
    _writeLogTerminal 0 "JetBrainsMono fonts is already installed"
else
    # Download JetBrainsMonoNerdFonts
    DOWNLOAD_URL="https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz"
    curl -o $download_folder/JetBrainsMono.tar.xz -OL "$DOWNLOAD_URL" &>>$(_getLogFile)

    # Install the fonts
    mkdir -p ~/.local/share/fonts/JetBrainsMonoNerd &>>$(_getLogFile)

    # Extract the new files into the JetBrainsMono folder and log the output
    tar -xJkf $download_folder/JetBrainsMono.tar.xz -C ~/.local/share/fonts/JetBrainsMonoNerd
    _writeLogTerminal 0 "JetBrainsMono fonts installed"
fi

# Install Fira_Sans to enable icons on sequoia theme
if [ -d /usr/share/fonts/Fira_Sans ]; then
    _writeLogTerminal 0 "Fira Sans font is already installed"
else
    sudo cp -rf $fonts_directory/Fira_Sans /usr/share/fonts
    _writeLogTerminal 0 "Fira_Sans font installed"
fi

# Update font cache and log the output
fc-cache -v &>>$(_getLogFile)
