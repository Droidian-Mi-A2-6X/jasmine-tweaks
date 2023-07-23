#!/bin/bash

echo "Adding useful/debugging repos for convenience..."
sudo echo 'deb http://droidian-stated.repo.droidian.org/bullseye-initial-implementation/ bullseye main' >> /etc/apt/sources.list
sudo echo 'deb http://droidian-libhybris.repo.droidian.org/bookworm-wayland-egl-displays/ bookworm main' >> /etc/apt/sources.list
sudo echo 'deb http://droidian-droidian-quirks.repo.droidian.org/bookworm-webkit-accel/ bookworm main' >> /etc/apt/sources.list


echo "Updating system..."
sudo apt update && sudo apt dist-upgrade -y && sudo apt install -y qtwayland5 seahorse power-profiles-daemon dialog

echo "Downloading fixes..."

sudo mkdir /lib/systemd/system/bluebinder.service.d/ && sudo wget https://raw.githubusercontent.com/Droidian-Mi-A2-6X/droidian-tweaks/master/lib/systemd/system/bluebinder.service.d/90-jasmine.conf -O /lib/systemd/system/bluebinder.service.d/90-jasmine.conf && sudo chmod 0644 /lib/systemd/system/bluebinder.service.d/90-jasmine.conf && sudo wget https://raw.githubusercontent.com/Droidian-Mi-A2-6X/droidian-tweaks/master/lib/systemd/system/brightness-fix.service -O /lib/systemd/system/brightness-fix.service && sudo chmod 0644 /lib/systemd/system/brightness-fix.service && sudo systemctl daemon-reload && sudo systemctl enable bluebinder.service && sudo systemctl enable brightness-fix.service && sudo systemctl start brightness-fix.service && sudo mkdir -p /etc/systemd/system/phosh.service.d/ && sudo wget https://raw.githubusercontent.com/Droidian-Mi-A2-6X/droidian-tweaks/master/etc/systemd/system/phosh.service.d/90-wait.conf -O /etc/systemd/system/phosh.service.d/90-wait.conf && sudo wget https://raw.githubusercontent.com/Droidian-Mi-A2-6X/droidian-tweaks/master/etc/systemd/system/android-mount.service.d/10-nogstdroid.conf -O /etc/systemd/system/android-mount.service.d/10-nogstdroid.conf && sudo rm /usr/share/phosh/phoc.ini && sudo wget https://github.com/Droidian-Mi-A2-6X/droidian-tweaks/raw/master/usr/share/phosh/phoc.ini -O /usr/share/phosh/phoc.ini && sudo chmod 0644 /usr/share/phosh/phoc.ini

echo "Fixes installed"

echo "Setting up flatpak repo(s) for convenience..."

flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo && flatpak remote-add --user --if-not-exists kdeapps http://distribute.kde.org/kdeapps.flatpakrepo

echo "Setting up alias for bootctl..."

echo 'alias switch-a="unset LD_PRELOAD; unset LD_LIBRARY_PATH; /system/bin/bootctl set-active-boot-slot 0"' >> ~/.bashrc
echo 'alias switch-b="unset LD_PRELOAD; unset LD_LIBRARY_PATH; /system/bin/bootctl set-active-boot-slot 1"' >> ~/.bashrc

echo "Rebooting now..."

sleep 5

sudo systemctl reboot
