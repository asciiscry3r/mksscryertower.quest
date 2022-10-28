#!/usr/bin/env bash

sudo mkdir -p /var/www/repo.mksscryertower.quest/repoupdate

sudo chown arch:arch -R /var/www/repo.mksscryertower.quest/repoupdate

aurpackages=(ace qt5-styleplugins acpitool alien_package_converter amttool-tng autotiling caffeine-ng cbonsai cpufetch debhelper debtap fotoxx gtk-theme-windows10-dark hardened_malloc hushboard-git i3lock-color icoextract imagewriter imgurbash2 intltool-debian libcurl-openssl-1.0 libestr libxerces-c-3.1 matplotlib-cpp-git mei-amt-check-git modprobed-db nerd-fonts-terminus nerd-fonts-ubuntu-mono numix-circle-icon-theme-git numix-icon-theme-git opencryptoki pa-applet-git picom-tryone-git po-debconf psi-notify pstreams python-pulsectl python-pyasn qt5-styleplugins redeclipse rpi-imager-bin sblim-sfcc sddm-lain-wired-theme sec siji-ttf teiler-git telegram-desktop-bin tpm-tools trousers ttf-unifont tfenv undistract-me-git ventoy-bin wireshark-gtk2 xbindkeys_config-gtk2 xininfo-git xsuspender-git yay-bin opensnitch-ebpf-module-git opensnitch-git)

cd /var/www/repo.mksscryertower.quest/repoupdate

yay -Syyu $aurpackages

builded=`ls -all | grep .pkg.tar.zst | awk '{ print $9 }'`

for pkg in ${builded[@]}; do
    gpg --use-agent --output $pkg.sig --detach-sig $pkg 
done

repo-add --verify --sign --new repo.mksscryertower.quest.db.tar.gz *.zst

sudo rm -rf /var/www/repo.mksscryertower.quest/repo/x86_64
sudo mv /var/www/repo.mksscryertower.quest/repoupdate /var/www/repo.mksscryertower.quest/repo/x86_64

sudo chown www-data:arch -R /var/www/repo.mksscryertower.quest/
