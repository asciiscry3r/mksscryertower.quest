#!/usr/bin/env bash

sudo mkdir -p /var/www/repo.mksscryertower.quest/repoupdate

sudo chown arch:arch -R /var/www/repo.mksscryertower.quest/repoupdate
sudo chown www-data:arch -R /var/www/repo.mksscryertower.quest/repo

aurpackages="ace qt5-styleplugins acpitool alien_package_converter amttool-tng autotiling caffeine-ng cbonsai cpufetch debhelper debtap fotoxx gtk-theme-windows10-dark hardened_malloc hushboard-git i3lock-color icoextract imagewriter imgurbash2 intltool-debian libcurl-openssl-1.0 libestr libxerces-c-3.1 matplotlib-cpp-git mei-amt-check-git modprobed-db numix-circle-icon-theme-git numix-icon-theme-git opencryptoki pa-applet-git picom-tryone-git po-debconf psi-notify pstreams python-pulsectl python-pyasn qt5-styleplugins redeclipse rpi-imager-bin sblim-sfcc sddm-lain-wired-theme sec siji-ttf teiler-git telegram-desktop-bin tpm-tools trousers ttf-unifont tfenv undistract-me-git ventoy-bin wireshark-gtk2 xbindkeys_config-gtk2 xininfo-git xsuspender-git btrfs-assistant flashfocus-git google-chrome inxi mintstick mkinitcpio-openswap networkmanager-support opensnitch-ebpf-module-git opensnitch-git os-prober-btrfs snapper-tools systemd-oomd-defaults timeshift yay-bin yed gqrx"

"acpitool alien_package_converter amttool-tng autotiling caffeine-ng cbonsai cpufetch debhelper debtap fotoxx gtk-theme-windows10-dark hardened_malloc hushboard-git i3lock-color icoextract imagewriter imgurbash2 intltool-debian libcurl-openssl-1.0 libestr libxerces-c-3.1 matplotlib-cpp-git mei-amt-check-git modprobed-db numix-circle-icon-theme-git numix-icon-theme-git opencryptoki pa-applet-git po-debconf psi-notify pstreams python-pulsectl python-pyasn redeclipse rpi-imager-bin sblim-sfcc sddm-lain-wired-theme sec siji-ttf teiler-git tpm-tools trousers ttf-unifont tfenv undistract-me-git ventoy-bin wireshark-gtk2 xbindkeys_config-gtk2 xininfo-git xsuspender-git btrfs-assistant flashfocus-git inxi mintstick mkinitcpio-openswap networkmanager-support os-prober-btrfs snapper-tools systemd-oomd-defaults timeshift yay-bin yed gqrx"

yay -Syyu --nocleanmenu --noeditmenu --nodiffmenu --noupgrademenu --rebuildall $aurpackages

# repo upgrade

cd /var/www/repo.mksscryertower.quest/repoupdate

rm -rf *.sig && rm -rf repo.mksscryertower*

builded=`ls -all | grep .pkg.tar.zst | awk '{ print $9 }'`

for pkg in ${builded[@]}; do
    gpg --use-agent --output $pkg.sig --detach-sig $pkg
done

# password name GPG
# do by service in right way [klimenkomaximsergievich max]# watch -n 1 tpm2_getrandom 32 > /dev/random
# sudo twuewand --bytes 32 | sudo rndaddentropy
# sudo tpm2_getrandom 32 | sudo rndaddentropy

repo-add --verify --sign --new repo.mksscryertower.quest.db.tar.gz *.zst

sudo rm -rf /var/www/repo.mksscryertower.quest/repo/x86_64 && sudo mkdir /var/www/repo.mksscryertower.quest/repo/x86_64 && sudo cp -R -f --remove-destination /var/www/repo.mksscryertower.quest/repoupdate/* /var/www/repo.mksscryertower.quest/repo/x86_64/ && sudo chown www-data:linuxuser -R /var/www/repo.mksscryertower.quest/repo

# repo upgrade

sudo rm -rf /home/max/Development/repo.mksscryertower.quest/repo/x86_64 && sudo mkdir /home/max/Development/repo.mksscryertower.quest/repo/x86_64 && sudo cp -R -f --remove-destination /home/max/Development/repo.mksscryertower.quest/repoupdate/* /home/max/Development/repo.mksscryertower.quest/repo/x86_64/ && ssh mksscryertower.quest sudo chown -R ubuntu:ubuntu /var/www/repo.mksscryertower.quest/ && ssh mksscryertower.quest sudo rm -rf /var/www/repo.mksscryertower.quest/repo/x86_64/* && rsync -r --progress /home/max/Development/repo.mksscryertower.quest/repo/*  mksscryertower.quest:/var/www/repo.mksscryertower.quest/repo/ && ssh mksscryertower.quest sudo chown -R www-data:www-data /var/www/repo.mksscryertower.quest/

arch@mksscryertower = Prometheus/Node/Nginx/NginxLog/Process
#
yay -S nginx-mainline lua nginx-mainline-mod-lua luarocks gettext lua-cjson

access_log  /var/log/nginx/mksscryertower/access.log;
access_log  /var/log/nginx/nginx/repo_mksscryertower/access.log;

/usr/lib/systemd/system/prometheus-node-exporter.service 127.0.0.1:9200
/usr/lib/systemd/system/prometheus-nginxlog-exporter.service 127.0.0.1:9040 - ????????????????????
/usr/lib/systemd/system/nginx-prometheus-exporter.service 127.0.0.1:9100
/usr/lib/systemd/system/process-exporter.service 127.0.0.1:9300
/usr/lib/systemd/system/promtail.service 127.0.0.1:9080

- match:
   selector: '{request_type="api"}'
   stages:
     - metrics:
         http_nginx_response_time:
           type: Histogram
           description: "response time ms"
           source: response_time
           config:
             buckets: [0.010,0.050,0.100,0.200,0.500,1.0]
- match:
   selector: '{request_type=~"static|photo"}'
   stages:
     - metrics:
         http_nginx_response_bytes_sum:
           type: Counter
           description: "response bytes sum"
           source: bytes_out
           config:
             action: add
         http_nginx_response_bytes_count:
           type: Counter
           description: "response bytes count"
           source: bytes_out
           config:
             action: inc


arch@info_mksscryertower = Node/Nginx/NginxLog/Process/Grafana

type = mysql
host = 127.0.0.1:3306
name = grafana
user = grafana
password = "^Jg&^$D!srZ"

/usr/lib/systemd/system/prometheus-node-exporter.service 127.0.0.1:9100
/usr/lib/systemd/system/nginx-prometheus-exporter.service 127.0.0.1:9113
/usr/lib/systemd/system/prometheus-nginxlog-exporter.service 127.0.0.1:9040 - ??????????????????????

mysql -h 127.0.0.1 -P 3306 -u grafana -D grafana -p'^Jg&44xHsysiQirxadTqC6J^$D!srZ'


# google.golang.org/grpc/cmd/protoc-gen-go-grpc
# loadinternal: cannot find runtime/cgo
# ~/.cache/yay/opensnitch-git/src/opensnitch/proto ~/.cache/yay/opensnitch-git/src/opensnitch
# protoc -I. ui.proto --go_out=../daemon/ui/protocol/ --go-grpc_out=../daemon/ui/protocol/ --go_opt=paths=source_r#elative --go-grpc_opt=paths=source_relative
# python3 -m grpc_tools.protoc -I. --python_out=../ui/opensnitch/ --grpc_python_out=../ui/opensnitch/ ui.proto
# ~/.cache/yay/opensnitch-git/src/opensnitch
# ~/.cache/yay/opensnitch-git/src/opensnitch/daemon ~/.cache/yay/opensnitch-git/src/opensnitch


# PostUp = ip rule add table 200 from 172.31.1.1
# PostUp = ip route add table 200 default via 172.31.1.1
# PreDown = ip rule delete table 200 from 172.31.1.1
# PreDown = ip route delete table 200 default via 172.31.1.1


nameserver 208.67.222.222
nameserver 208.67.220.220
nameserver 8.8.8.8
nameserver 8.8.4.4
nameserver 1.1.1.1
nameserver 1.0.0.1
nameserver 9.9.9.9
nameserver 9.9.4.4
nameserver 185.228.168.9
nameserver 185.228.169.9
nameserver 76.76.19.19
nameserver 76.223.122.150

DNS = 208.67.222.222
DNS = 208.67.220.220
DNS = 8.8.8.8
DNS = 8.8.4.4
DNS = 9.9.9.9
DNS = 9.9.4.4
DNS = 1.1.1.1
DNS = 185.228.168.9
DNS = 185.228.169.9
DNS = 76.76.19.19
DNS = 76.223.122.150

name_server 208.67.222.222 208.67.220.220 8.8.8.8 8.8.4.4 1.1.1.1 1.0.0.1 185.228.168.9 185.228.169.9 76.76.19.19 76.223.122.150


sudo chattr +i /etc/ppp/resolv.conf
# Generated by resolvconf
nameserver 208.67.222.222
nameserver 208.67.220.220
nameserver 1.1.1.1
nameserver 8.8.8.8
nameserver 8.8.4.4
nameserver 1.0.0.1
nameserver 185.228.168.9
nameserver 185.228.169.9
nameserver 76.76.19.19
nameserver 76.223.122.150
options edns0 single-request

              python-autocommand-2.2.2-4  python-fastjsonschema-2.17.1-1  python-inflect-6.0.4-2
              python-jaraco.context-4.3.0-3  python-jaraco.functools-3.7.0-1  python-jaraco.text-3.11.1-3
              python-more-itertools-9.1.1-4  python-ordered-set-4.1.0-4  python-platformdirs-3.5.1-1
              python-pydantic-1.10.8-1  python-tomli-2.0.1-3  python-trove-classifiers-2023.5.24-1
              python-validate-pyproject-0.13-1  git-2.41.0-1  python-build-0.10.0-4  python-installer-0.7.0-3
              python-setuptools-1:67.8.0-1  python-wheel-0.40.0-3

[max@mksscryerpc pyboinc]$ namcap pyboinc-0.0.1-1-any.pkg.tar.zst

pyboinc E: Missing custom license directory (usr/share/licenses/pyboinc)
pyboinc W: Referenced python module 'pyboinc.init_rpc_client' is an uninstalled dependency (needed in files ['usr/lib/python3.11/site-packages/pyboinc/tests/test_web.py'])
pyboinc W: Referenced python module 'pyboinc.rpc_client.GUI_RPC_DEFAULT_PORT' is an uninstalled dependency (needed in files ['usr/lib/python3.11/site-packages/pyboinc/tests/test_web.py'])
pyboinc W: Description should not contain the package name.
pyboinc E: Dependency python detected and not included (python modules ['typing.List', 'datetime.datetime', 'datetime.timedelta', 'typing.Dict', 'typing.Union', 'unittest', 'hashlib.md5', 'enum.Enum', 'socket.AF_INET', 'asyncio', 'xml.etree.ElementTree'] needed in files ['usr/lib/python3.11/site-packages/pyboinc/tests/test_web.py', 'usr/lib/python3.11/site-packages/pyboinc/rpc_client.py', 'usr/lib/python3.11/site-packages/pyboinc/_parse.py', 'usr/lib/python3.11/site-packages/pyboinc/_constants.py', 'usr/lib/python3.11/site-packages/pyboinc/_raw_client.py'], programs ['python'] needed in scripts ['usr/lib/python3.11/site-packages/pyboinc/tests/test_web.py'])

{'name': 'MCM1_0199813_6491_0', 'wu_name': 'MCM1_0199813_6491', 'platform': 'x86_64-pc-linux-gnu', 'version_num': 761, 'plan_class': True, 'project_url': <Project https://www.worldcommunitygrid.org/, {'master_url': 'https://www.worldcommunitygrid.org/'}>, 'final_cpu_time': datetime.timedelta(0), 'final_elapsed_time': datetime.timedelta(0), 'exit_status': 0, 'state': 2, 'report_deadline': datetime.datetime(2023, 6, 11, 0, 55, 59), 'received_time': datetime.datetime(2023, 6, 5, 0, 55, 59, 226586), 'estimated_cpu_time_remaining': datetime.timedelta(seconds=36782, microseconds=626123), 'active_task': {'active_task_state': 1, 'app_version_num': 761, 'slot': 0, 'pid': 9812, 'scheduler_state': 2, 'checkpoint_cpu_time': datetime.timedelta(seconds=3615, microseconds=130000), 'fraction_done': 0.057327, 'current_cpu_time': datetime.timedelta(seconds=3653, microseconds=53000), 'elapsed_time': datetime.timedelta(seconds=3763, microseconds=220714), 'swap_size': 70242304.0, 'working_set_size': 69492736.0, 'working_set_size_smoothed': 69492735.0, 'page_fault_rate': 0.0, 'bytes_sent': 0.0, 'bytes_received': 0.0, 'progress_rate': 1.4e-05, 'graphics_exec_path': '/var/lib/boinc/projects/www.worldcommunitygrid.org/wcgrid_mcm1_gfx_7.61_x86_64-pc-linux-gnu', 'slot_path': '/var/lib/boinc/slots/0'}}
{'name': 'MCM1_0199813_6493_1', 'wu_name': 'MCM1_0199813_6493', 'platform': 'x86_64-pc-linux-gnu', 'version_num': 761, 'plan_class': True, 'project_url': <Project https://www.worldcommunitygrid.org/, {'master_url': 'https://www.worldcommunitygrid.org/'}>, 'final_cpu_time': datetime.timedelta(0), 'final_elapsed_time': datetime.timedelta(0), 'exit_status': 0, 'state': 2, 'report_deadline': datetime.datetime(2023, 6, 11, 0, 55, 59), 'received_time': datetime.datetime(2023, 6, 5, 0, 55, 59, 226586), 'estimated_cpu_time_remaining': datetime.timedelta(seconds=39019, microseconds=516686)}

# Klimenko Maxim Sergievich
# https://github.com/imthenachoman/How-To-Secure-A-Linux-Server/tree/master
# https://www.kernel.org/doc/Documentation/sysctl/net.txt
# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/networking/ip-sysctl.txt?id=d82bae12dc38d79a2b77473f5eb0612a3d69c55b
# https://www.kernel.org/doc/Documentation/sysctl/vm.txt
# https://www.ibm.com/docs/en/linux-on-systems?topic=tuning-tcpip-ipv4-settings
# https://wiki.webko.net.ua/index.php?title=Kernel:_Neighbour_table_overflow/%D0%9F%D0%B5%D1%80%D0%B5%D0%BF%D0%BE%D0%BB%D0%BD%D0%B5%D0%BD%D0%B8%D0%B5_arp_%D1%82%D0%B0%D0%B1%D0%BB%D0%B8%D1%86%D0%B8

###
### Performance
###

# Recommended value to improve performance when sufficient memory exists in a system
vm.swappiness=10

###
### SYSTEM SECURITY ###
###

# Enable address Space Randomization
kernel.randomize_va_space=2

# Restrict core dumps
fs.suid_dumpable=0

# Maximum number of open files
fs.file-max=65535

# Maximum number of process pid
kernel.pid_max=65535

# Defines the maximum allowable size in bytes of any single message in a message queue. This value must not exceed the size of the queue (msgmnb). Defines the maximum size in bytes of a single message queue.
kernel.msgmax=65535
kernel.msgmnb=65535

# This parameter sets the total amount of shared memory pages that can be used system wide.
# 3906250 for (shmall*PAGE_SIZE) and 16 Gb
kernel.shmall=268435456
kernel.shmmax=268435456

# Hide kernel pointers
# kernel.kptr_restrict=2

# Restrict reading from /proc/<pid>/maps to those who share ->mm or can ptrace pid
# kernel.maps_protect=1 No such file or directory

# Restrict access to kernel logs
kernel.dmesg_restrict=1

# Restrict ptrace scope
# kernel.yama.ptrace_scope=1

# Protect links on the filesystem
fs.protected_hardlinks=1
fs.protected_symlinks=1

# By setting core_uses_pid to 1, the coredump filename becomes core.PID
kernel.core_uses_pid=1

# tty: ldisc: set 0 to prevent autoloading of ldiscs
dev.tty.ldisc_autoload=0

# This restricts loading TTY line disciplines to the CAP_SYS_MODULE capability to prevent unprivileged attackers from loading vulnerable line disciplines with the TIOCSETD ioctl, which has been abused in a number of exploits before.
vm.unprivileged_userfaultfd=0

# Disallows open of FIFOs or regular files not owned by the user in world
fs.protected_fifos=2
fs.protected_regular=2

# Magic SysRq key
# kernel.sysrq=0

kernel.ctrl-alt-del=0

# Non-Maskable Interrupt(NMI)
kernel.nmi_watchdog=1

# Kexec allows replacing the current running kernel
kernel.kexec_load_disabled=1

# User namespaces
# user.max_user_namespaces=0

# Unprivileged user namespaces
kernel.unprivileged_userns_clone=0

# Performance events add considerable kernel attack surface and have caused abundant vulnerabilities. This sysctl restricts all usage of performance events to the CAP_PERFMON capability (CAP_SYS_ADMIN on kernel versions prior to 5.8).
kernel.perf_event_paranoid=3

# ASLR is a common exploit mitigation which randomises the position of critical parts of a process in memory. This can make a wide variety of exploits harder to pull off, as they first require an information leak. The above settings increase the bits of entropy used for mmap ASLR, improving its effectiveness.
vm.mmap_rnd_bits=32
vm.mmap_rnd_compat_bits=16

# Contains, as a percentage of total available memory that contains free pages and reclaimable pages, the number of pages at which the background kernel flusher threads will start writing out dirty data.
vm.dirty_background_ratio=5

# Contains, as a percentage of total available memory that contains free pages and reclaimable pages, the number of pages at which a process which is generating disk writes will itself start writing out dirty data.
vm.dirty_ratio=30

# This is used to force the Linux VM to keep a minimum number of kilobytes free.
vm.min_free_kbytes=65535

# This file indicates the amount of address space  which a user process will be restricted from mmapping.
vm.mmap_min_addr=4096

# This value contains a flag that enables memory overcommitment.
vm.overcommit_memory=0

# When overcommit_memory is set to 2, the committed address space is not permitted to exceed swap plus this percentage of physical RAM.
vm.overcommit_ratio=50

# Enabling non-executable memfds
vm.memfd_noexec=1


###
### NETWORK SECURITY ###
###

# Do not allow unprivileged users to run code in the kernel through BPF
kernel.unprivileged_bpf_disabled=1
# Enable JIT compiler against SPECTRE variants
net.core.bpf_jit_enable=1
# Harden BPF JIT compiler
net.core.bpf_jit_harden=2

# Prevent SYN attack, enable SYNcookies (they will kick-in when the max_syn_backlog reached)
net.ipv4.tcp_syncookies=1
net.ipv4.tcp_syn_retries=2
net.ipv4.tcp_synack_retries=2
net.ipv4.tcp_max_syn_backlog=4096

# Enable IP spoofing protection
# Turn on source route verification
net.ipv4.conf.all.rp_filter=1
net.ipv4.conf.default.rp_filter=1

# Disable Redirect Acceptance
net.ipv4.conf.all.accept_redirects=0
net.ipv4.conf.default.accept_redirects=0
net.ipv4.conf.all.secure_redirects=0
net.ipv4.conf.default.secure_redirects=0
net.ipv6.conf.all.accept_redirects=0
net.ipv6.conf.default.accept_redirects=0
net.ipv4.conf.default.send_redirects=0
net.ipv4.conf.all.send_redirects=0

# Disable Redirect Sending
net.ipv4.conf.all.send_redirects=0
net.ipv4.conf.default.send_redirects=0

# Disable IP source routing
net.ipv4.conf.all.accept_source_route=0
net.ipv4.conf.default.accept_source_route=0
net.ipv6.conf.all.accept_source_route=0
net.ipv6.conf.default.accept_source_route=0

# Don't relay bootp
net.ipv4.conf.all.bootp_relay=0
net.ipv4.conf.default.bootp_relay=0
net.ipv4.conf.lo.bootp_relay=0
net.ipv4.conf.enX0.bootp_relay=0
net.ipv4.conf.ppp0.bootp_relay=0
net.ipv4.conf.enp9s0.bootp_relay=0
net.ipv4.conf.enp5s0.bootp_relay=0

# Disable proxy ARP
net.ipv4.conf.all.proxy_arp=0
net.ipv4.conf.all.arp_ignore=1
net.ipv4.conf.all.arp_announce=2

# Mitigate time-wait assassination hazards in TCP
net.ipv4.tcp_rfc1337=1

# Enable Explicit Congestion Notification (RFC 3168), disable it if it doesn't work for you
net.ipv4.tcp_ecn=1
net.ipv4.tcp_reordering=3

# Enable TCP Fast Open (RFC7413) to send and accept data in the opening SYN packet.
net.ipv4.tcp_fastopen=0

# # While a perfectly valid “receive only” state for an un-orphaned connection, an orphaned connection in FIN_WAIT_2 state could otherwise wait forever for the remote to close its end of the connection.
net.ipv4.tcp_fin_timeout=15

# TCP keepalive
net.ipv4.tcp_keepalive_intvl=15
net.ipv4.tcp_keepalive_probes=5
net.ipv4.tcp_keepalive_time=1800

# Enable logging martian packages
# Otherwise it might cause DOS
net.ipv4.conf.default.log_martians=1
net.ipv4.conf.all.log_martians=1

# Enable bad error message Protection
net.ipv4.icmp_ignore_bogus_error_responses=0

# Enable ignoring broadcasts request
net.ipv4.icmp_echo_ignore_broadcasts=1

# Disable icmp echo requests
net.ipv4.icmp_echo_ignore_all=0

# Accept Router Advertisements; autoconfigure using them
net.ipv6.conf.all.accept_ra=0
net.ipv6.conf.default.accept_ra=0

# IPV6 autoconfiguration
net.ipv6.conf.all.autoconf=0
net.ipv6.conf.default.autoconf=0
net.ipv6.conf.lo.autoconf=0
net.ipv6.conf.enX0.autoconf=0
net.ipv6.conf.ppp0.autoconf=0
net.ipv6.conf.enp9s0.autoconf=0
net.ipv6.conf.enp5s0.autoconf=0

# Ensure that subsequent connections use the new values
# PUT TO THE END
net.ipv4.route.flush=1
net.ipv6.route.flush=1

# IPv6 addresses are generated from your computer's MAC address, making your IPv6 address unique and tied directly to your computer. Privacy extensions generate a random IPv6 address to mitigate this form of tracking. Note that these steps are unnecessary if you have spoofed your MAC address or have disabled IPv6.
# net.ipv6.conf.all.use_tempaddr=2
# net.ipv6.conf.default.use_tempaddr=2

# CVE-2023-2156
net.ipv6.conf.all.rpl_seg_enabled=0
net.ipv6.conf.default.rpl_seg_enabled=0

# Disable IPv6
net.ipv6.conf.default.disable_ipv6=1
net.ipv6.conf.all.disable_ipv6=1
net.ipv6.conf.lo.disable_ipv6=1
net.ipv6.conf.enX0.disable_ipv6=1
net.ipv6.conf.ppp0.disable_ipv6=1
net.ipv6.conf.enp9s0.disable_ipv6=1
net.ipv6.conf.enp5s0.disable_ipv6=1
