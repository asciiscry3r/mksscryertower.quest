2FA for Servers
###############

:date: 2022-10-10 10:20
:modified: 2024-11-23 03:40
:tags: knowlege, science
:category: knowlege, science
:slug: 2FA for Servers
:authors: Klimenko Maxim Sergievich
:summary: 2FA for Servers

###############

Start from libpam-google-authenticator installation

..  code-block:: shell

    $ sudo apt-get install libpam-google-authenticator

    $ yay -S libpam-google-authenticator

    # opkg install libpam-google-authenticator


File /etc/ssh/sshd_config don`t reload after edit

..  code-block:: shell

    root@mksnanopineo2:~# cat /etc/ssh/sshd_config
    Include /etc/ssh/sshd_config.d/*.conf

    Port 22
    AddressFamily inet
    ListenAddress 192.168.0.130 # your local ip / or 0.0.0.0


    #HostKey /etc/ssh/ssh_host_rsa_key
    #HostKey /etc/ssh/ssh_host_ecdsa_key
    #HostKey /etc/ssh/ssh_host_ed25519_key

    # Ciphers and keying
    #RekeyLimit default none

    # Logging
    #SyslogFacility AUTH
    #LogLevel INFO

    # Authentication:

    LoginGraceTime 2m
    PermitRootLogin no
    StrictModes yes
    MaxAuthTries 6
    MaxSessions 10

    PubkeyAuthentication yes

    # Expect .ssh/authorized_keys2 to be disregarded by default in future.
    #AuthorizedKeysFile	.ssh/authorized_keys .ssh/authorized_keys2

    #AuthorizedPrincipalsFile none

    #AuthorizedKeysCommand none
    #AuthorizedKeysCommandUser nobody

    # For this to work you will also need host keys in /etc/ssh/ssh_known_hosts
    #HostbasedAuthentication no
    # Change to yes if you don't trust ~/.ssh/known_hosts for
    # HostbasedAuthentication
    #IgnoreUserKnownHosts no
    # Don't read the user's ~/.rhosts and ~/.shosts files
    IgnoreRhosts yes

    # To disable tunneled clear text passwords, change to no here!
    PasswordAuthentication no
    PermitEmptyPasswords no

    # Change to yes to enable challenge-response passwords (beware issues with
    # some PAM modules and threads) Needed for OTP.
    KbdInteractiveAuthentication yes
    AuthenticationMethods publickey,keyboard-interactive:pam

    # Kerberos options
    #KerberosAuthentication no
    #KerberosOrLocalPasswd yes
    #KerberosTicketCleanup yes
    #KerberosGetAFSToken no

    # GSSAPI options
    #GSSAPIAuthentication no
    #GSSAPICleanupCredentials yes
    #GSSAPIStrictAcceptorCheck yes
    #GSSAPIKeyExchange no

    UsePAM yes
    ChallengeResponseAuthentication yes

    #AllowAgentForwarding yes
    #AllowTcpForwarding yes
    #GatewayPorts no
    X11Forwarding no
    #X11DisplayOffset 10
    #X11UseLocalhost yes
    #PermitTTY yes
    PrintMotd no
    #PrintLastLog yes
    #TCPKeepAlive yes
    #PermitUserEnvironment no
    #Compression delayed
    #ClientAliveInterval 0
    #ClientAliveCountMax 3
    #UseDNS no
    #PidFile /run/sshd.pid
    #MaxStartups 10:30:100
    #PermitTunnel no
    #ChrootDirectory none
    #VersionAddendum none

    # no default banner path
    #Banner none

    # Allow client to pass locale environment variables
    AcceptEnv LANG LC_*

    # override default of no subsystems
    Subsystem	sftp	/usr/lib/openssh/sftp-server

    # Example of overriding settings on a per-user basis
    #Match User anoncvs
    #	X11Forwarding no
    #	AllowTcpForwarding no
    #	PermitTTY no
    #	ForceCommand cvs server
    Match Address 192.168.0.0/16 # your local subnets
		 PubkeyAuthentication yes
		 PasswordAuthentication yes
		 PermitRootLogin yes
    root@mksnanopineo2:~#


Do not forgot to check defaults in sshd_config.d folder, they all have higher priority ( numbered )then main sshd config file:

.. image:: images/img-2024-11-23-030640.png
           :align: left

File /etc/pam.d/sshd for openwrt use `this`_

..  code-block:: shell

    root@mksnanopineo2:~# cat /etc/pam.d/sshd
    # PAM configuration for the Secure Shell service

    # Standard Un*x authentication.
    @include common-auth

    # two-factor authentication via Google Authenticator !!!!!!!!!!!!!!!!
    auth   required   pam_google_authenticator.so

    # Disallow non-root logins when /etc/nologin exists.
    account    required     pam_nologin.so

    # Uncomment and edit /etc/security/access.conf if you need to set complex
    # access limits that are hard to express in sshd_config.
    # account  required     pam_access.so

    # Standard Un*x authorization.
    @include common-account

    # SELinux needs to be the first session rule.  This ensures that any
    # lingering context has been cleared.  Without this it is possible that a
    # module could execute code in the wrong domain.
    session [success=ok ignore=ignore module_unknown=ignore default=bad]        pam_selinux.so close

    # Set the loginuid process attribute.
    session    required     pam_loginuid.so

    # Create a new session keyring.
    session    optional     pam_keyinit.so force revoke

    # Standard Un*x session setup and teardown.
    @include common-session

    # Print the message of the day upon successful login.
    # This includes a dynamically generated part from /run/motd.dynamic
    # and a static (admin-editable) part from /etc/motd.
    session    optional     pam_motd.so  motd=/run/motd.dynamic
    session    optional     pam_motd.so noupdate

    # Print the status of the user's mailbox upon successful login.
    session    optional     pam_mail.so standard noenv # [1]

    # Set up user limits from /etc/security/limits.conf.
    session    required     pam_limits.so

    # Read environment variables from /etc/environment and
    # /etc/security/pam_env.conf.
    session    required     pam_env.so # [1]
    # In Debian 4.0 (etch), locale-related environment variables were moved to
    # /etc/default/locale, so read that as well.
    session    required     pam_env.so user_readenv=1 envfile=/etc/default/locale

    # SELinux needs to intervene at login time to ensure that the process starts
    # in the proper default security context.  Only sessions which are intended
    # to run in the user's context should be run after this.
    session [success=ok ignore=ignore module_unknown=ignore default=bad]        pam_selinux.so open

    # Standard Un*x password updating.
    @include common-password
    root@mksnanopineo2:~#

.. code-block:: shell
    [arch@mksscryertower ~]$ cat /etc/pam.d/sshd
    #%PAM-1.0

    auth      required  pam_securetty.so   #disable remote root
    auth      required  pam_google_authenticator.so
    #auth      include   system-remote-login
    account   include   system-remote-login
    password  include   system-remote-login
    session   include   system-remote-login


Run command:

..  code-block:: shell

    $ google-authenticator

    blabla
    bla

    QR CODE



On your mobile device, open the `Google Authenticator`_ app, select + to add a new account. Then, select Scan a QR code, enabling you to scan the previously generated QR code. Scanning the QR code will show you the Linux virtual machine (VM) name, the user account, and a unique TOTP code that changes every 30 seconds.


.. _`Google Authenticator`: https://goteleport.com/blog/ssh-2fa-tutorial/

.. _`this`: https://openwrt.org/docs/guide-user/services/ssh/ssh.mfa.auth

Reload or restart sshd

..  code-block:: shell

    sudo systemctl restart sshd


End
