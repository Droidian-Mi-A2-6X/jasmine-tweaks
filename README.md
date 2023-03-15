# Droidian Tweaks

These tweaks are specifically for jasmine/wayne. At some point these fixes should be turned into device adaptation package. Running `setup.sh` file fixes the following bugs:

1. Brightness (You must disable automatic brightness from settings>power in gnome settings)
2. Bluetooth
3. Scaling

The `setup.sh` script additionally installs and enables flathub and kdeapps flathub repos and sets `switch-a` and `switch-b` bootctl alias too.

If phone is on black screen after boot:

`ssh droidian@10.15.19.82`

`sudo -i`

`echo 100 > /sys/class/leds/lcd-backlight/brightness && exit`

After display is up, connect to Wi-Fi and try using apt via console or terminal on your PC. If apt is busy wait for it to free up and once its ready run the following:

`wget https://github.com/Droidian-Mi-A2-6X/droidian-tweaks/raw/master/setup.sh && chmod +x setup.sh && ./setup.sh`

For waydroid (work in progress!)

`wget https://github.com/Droidian-Mi-A2-6X/droidian-tweaks/raw/master/waydroid-setup.sh && chmod +x waydroid-setup.sh && ./waydroid-setup.sh`
