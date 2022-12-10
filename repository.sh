
#!/usr/bin/env bash

sudo mkdir -p /var/www/repo.mksscryertower.quest/repoupdate

sudo chown arch:arch -R /var/www/repo.mksscryertower.quest/repoupdate
sudo chown www-data:arch -R /var/www/repo.mksscryertower.quest/repo

aurpackages="ace qt5-styleplugins acpitool alien_package_converter amttool-tng autotiling caffeine-ng cbonsai cpufetch debhelper debtap fotoxx gtk-theme-windows10-dark hardened_malloc hushboard-git i3lock-color icoextract imagewriter imgurbash2 intltool-debian libcurl-openssl-1.0 libestr libxerces-c-3.1 matplotlib-cpp-git mei-amt-check-git modprobed-db numix-circle-icon-theme-git numix-icon-theme-git opencryptoki pa-applet-git picom-tryone-git po-debconf psi-notify pstreams python-pulsectl python-pyasn qt5-styleplugins redeclipse rpi-imager-bin sblim-sfcc sddm-lain-wired-theme sec siji-ttf teiler-git telegram-desktop-bin tpm-tools trousers ttf-unifont tfenv undistract-me-git ventoy-bin wireshark-gtk2 xbindkeys_config-gtk2 xininfo-git xsuspender-git btrfs-assistant flashfocus-git google-chrome inxi mintstick mkinitcpio-openswap networkmanager-support opensnitch-ebpf-module-git opensnitch-git os-prober-btrfs snapper-tools systemd-oomd-defaults timeshift yay-bin yed"


yay -Syyu --nocleanmenu --noeditmenu --nodiffmenu --noupgrademenu --rebuildall $aurpackages

cd /var/www/repo.mksscryertower.quest/repoupdate

rm -rf *.sig

rm -rf repo.mksscryertower*

builded=`ls -all | grep .pkg.tar.zst | awk '{ print $9 }'`

for pkg in ${builded[@]}; do
    gpg --use-agent --output $pkg.sig --detach-sig $pkg
done

repo-add --verify --sign --new repo.mksscryertower.quest.db.tar.gz *.zst

sudo cp -R /var/www/repo.mksscryertower.quest/repo/x86_64 /var/www/repo.mksscryertower.quest/repo/repobackup-$(date +%H%M%m%d%Y)
# sudo rm -rf /var/www/repo.mksscryertower.quest/repo/x86_64 && sudo mkdir /var/www/repo.mksscryertower.quest/repo/x86_64
sudo cp -R -f --remove-destination /var/www/repo.mksscryertower.quest/repoupdate/* /var/www/repo.mksscryertower.quest/repo/x86_64/ && sudo chown www-data:arch -R /var/www/repo.mksscryertower.quest/repo

# google.golang.org/grpc/cmd/protoc-gen-go-grpc
#loadinternal: cannot find runtime/cgo
#~/.cache/yay/opensnitch-git/src/opensnitch/proto ~/.cache/yay/opensnitch-git/src/opensnitch
#protoc -I. ui.proto --go_out=../daemon/ui/protocol/ --go-grpc_out=../daemon/ui/protocol/ --go_opt=paths=source_r#elative --go-grpc_opt=paths=source_relative
#python3 -m grpc_tools.protoc -I. --python_out=../ui/opensnitch/ --grpc_python_out=../ui/opensnitch/ ui.proto
#~/.cache/yay/opensnitch-git/src/opensnitch
#~/.cache/yay/opensnitch-git/src/opensnitch/daemon ~/.cache/yay/opensnitch-git/src/opensnitch
