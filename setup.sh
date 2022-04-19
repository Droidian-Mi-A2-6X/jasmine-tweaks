#!/bin/bash

echo "Adding useful/debugging repos for convenience..."
sudo echo 'deb http://droidian-stated.repo.droidian.org/bullseye-initial-implementation/ bullseye main' >> /etc/apt/sources.list

echo "Updating system..."
sudo apt update && sudo apt dist-upgrade -y && sudo apt install -y qtwayland5 seahorse power-profiles-daemon

echo "Downloading fixes..."

sudo mkdir /lib/systemd/system/bluebinder.service.d/

echo "Created bluebinder service directory"

sudo wget https://raw.githubusercontent.com/Droidian-Mi-A2-6X/droidian-tweaks/master/lib/systemd/system/bluebinder.service.d/90-jasmine.conf -O /lib/systemd/system/bluebinder.service.d/90-jasmine.conf && sudo chmod 0644 /lib/systemd/system/bluebinder.service.d/90-jasmine.conf

echo "Downloaded bluebinder fix"

sudo wget https://raw.githubusercontent.com/Droidian-Mi-A2-6X/droidian-tweaks/master/lib/systemd/system/brightness-fix.service -O /lib/systemd/system/brightness-fix.service && sudo chmod 0644 /lib/systemd/system/brightness-fix.service

echo "Downloaded brightness fix"

sudo wget https://raw.githubusercontent.com/Droidian-Mi-A2-6X/droidian-tweaks/master/lib/systemd/system/disable-lmk.service -O /lib/systemd/system/disable-lmk.service && sudo chmod 0644 /lib/systemd/system/disable-lmk.service && sudo wget https://raw.githubusercontent.com/Droidian-Mi-A2-6X/droidian-tweaks/master/usr/bin/disable-lmk.sh -O /usr/bin/disable-lmk.sh && sudo chmod +x /usr/bin/disable-lmk.sh

echo "Downloaded LMK fix"

sudo systemctl daemon-reload && sudo systemctl enable bluebinder.service && sudo systemctl enable brightness-fix.service && sudo systemctl start brightness-fix.service && sudo systemctl enable disable-lmk.service && sudo systemctl start disable-lmk.service

echo "Fixes installed"

sudo rm /usr/share/phosh/phoc.ini && sudo wget https://github.com/Droidian-Mi-A2-6X/droidian-tweaks/raw/master/usr/share/phosh/phoc.ini -O /usr/share/phosh/phoc.ini && sudo chmod 0644 /usr/share/phosh/phoc.ini

echo "Downloaded screen resolution fix"

echo "Setting up flatpak repo(s) for convenience..."

flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo && flatpak remote-add --user --if-not-exists kdeapps http://distribute.kde.org/kdeapps.flatpakrepo

echo "Setting up alias for bootctl..."

echo 'alias switch-a="unset LD_PRELOAD; unset LD_LIBRARY_PATH; /system/bin/bootctl set-active-boot-slot 0"' >> ~/.bashrc
echo 'alias switch-b="unset LD_PRELOAD; unset LD_LIBRARY_PATH; /system/bin/bootctl set-active-boot-slot 1"' >> ~/.bashrc

echo "Rebooting now..."

sleep 5

sudo systemctl reboot
