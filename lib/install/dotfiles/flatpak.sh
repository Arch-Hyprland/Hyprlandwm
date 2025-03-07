#!/bin/bash
apps_directory="$1"
log_file="$2"
runtime="org.gnome.Platform/x86_64/47"

_checkFlatpakAppExists() {
	app="$1"
	flatpak_output=$(flatpak info $runtime)
	if [[ $flatpak_output == *"ID:"* ]]; then
	  	echo 0
	else
		echo 1
	fi
}

cd $apps_directory

if [ $log_file == "dev" ]; then
    # Install Apps
    flatpak --user -y --reinstall install com.ml4w.calendar.flatpak
    echo ":: com.ml4w.calendar.flatpak installed"
    flatpak --user -y --reinstall install com.ml4w.welcome.flatpak
    echo ":: com.ml4w.welcome.flatpak installed"
    flatpak --user -y --reinstall install com.ml4w.settings.flatpak
    echo ":: com.ml4w.setting.flatpak installed"
    flatpak --user -y --reinstall install com.ml4w.sidebar.flatpak
    echo ":: com.ml4w.sidebar.flatpak installed"
    flatpak --user -y --reinstall install com.ml4w.hyprlandsettings.flatpak
    echo ":: com.ml4w.hyprlandsettings.flatpak installed"
else
    # Install Runtime
    echo ":: Installing runtime"

    # Check for runtime
    if [ "$(_checkFlatpakAppExists "$runtime")" == "1" ]; then
        echo
        echo ":: Installing runtime $runtime"
        sudo flatpak -y install $runtime  &>>$log_file
    fi    

    # Add Flathub Remote
    echo ":: Adding Flathub Remote"
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

    # Install Apps
    flatpak --user -y --reinstall install com.ml4w.calendar.flatpak &>>$log_file
    echo ":: com.ml4w.calendar.flatpak installed"
    flatpak --user -y --reinstall install com.ml4w.welcome.flatpak &>>$log_file
    echo ":: com.ml4w.welcome.flatpak installed"
    flatpak --user -y --reinstall install com.ml4w.settings.flatpak &>>$log_file
    echo ":: com.ml4w.setting.flatpak installed"
    flatpak --user -y --reinstall install com.ml4w.sidebar.flatpak &>>$log_file
    echo ":: com.ml4w.sidebar.flatpak installed"
    flatpak --user -y --reinstall install com.ml4w.hyprlandsettings.flatpak &>>$log_file
    echo ":: com.ml4w.hyprlandsetting.flatpak installed"
fi
