Local DNS server on NanoPi Neo2
###############################

:date: 2023-01-25 05:30
:tags: diy, cybersecurity, it, dns
:category: diy, cybersecurity, it, dns
:slug: Local DNS server on NanoPi Neo2
:authors: Klimenko/Tsikunkov Maxim Sergievich
:summary: Local DNS server on NanoPi Neo2

###############################

.. image:: images/mksnanopineo.png
           :align: left


Start from Bind9 installation

..  code-block:: shell

    sudo apt-get install bind9 bind9utils bind9-doc


File /etc/bind/named.conf.local

..  code-block:: shell

    root@mksnanopineo2:~# cat /etc/bind/named.conf.local
    //
    // Do any local configuration here
    //

    // Consider adding the 1918 zones here, if they are not used in your
    // organization
    //include "/etc/bind/zones.rfc1918";
    // Forward-Lookup
    zone "berry.home" {
          type master;
          file "/etc/bind/zones/berry.home.zone";
          allow-transfer { acl_trusted_transfer; };    //see named.conf.options for configuration
    };

    // Reverse-Lookup
    zone "2.168.192.in-addr.arpa" {
          type master;
          file "/etc/bind/zones/db.2.168.192.inv";
    };
    root@mksnanopineo2:~#


File /etc/bind/named.conf.local

..  code-block:: shell

    root@mksnanopineo2:~# cat /etc/bind/named.conf.local
    //
    // Do any local configuration here
    //

    // Consider adding the 1918 zones here, if they are not used in your
    // organization
    //include "/etc/bind/zones.rfc1918";
    // Forward-Lookup
    zone "home.lan" {
          type master;
          file "/etc/bind/zones/db.home.lan.zone";
          allow-transfer { acl_trusted_transfer; };    //see named.conf.options for configuration
    };

    // Reverse-Lookup
    zone "168.192.in-addr.arpa" {
          type master;
          file "/etc/bind/zones/db.168.192.zone";
    };
    root@mksnanopineo2:~#


File /etc/bind/named.conf.options

..  code-block:: shell

    root@mksnanopineo2:~# cat /etc/bind/named.conf.options
    acl "acl_trusted_transfer" {
         none;
    };

    acl "acl_trusted_clients" {
         127.0.0.0/8;        // localhost (RFC 3330) - Loopback-Device addresses    127.0.0.0 - 127.255.255.255
         192.168.0.0/16;     // Private Network (RFC 1918) - e. e. LAN              192.168.0.0 - 192.168.255.255
         //10.0.0.0/8;         // Private Network (RFC 1918) - e. g. VPN              10.0.0.0 - 10.255.255.255
         };

         options {
	     directory "/hdd/bind9/cache";

	     forwarders {
		    8.8.8.8;
		    8.8.4.4;
		    1.1.1.1;
		    9.9.9.9;
                    208.67.222.222;
                    208.67.220.220;
	     };

	     allow-query {
		  acl_trusted_clients;
	     };

	     allow-query-cache {
	          acl_trusted_clients;
	     };

	     allow-recursion {
	          acl_trusted_clients;
	     };

             allow-transfer {
                  none;
             };

	     allow-update {
                  none;
             };

       	     dnssec-validation yes;

             auth-nxdomain no;

	     recursion yes;

             empty-zones-enable yes;

	     listen-on-v6 { none; };

	     listen-on { any; };
   };
   root@mksnanopineo2:~#


File /etc/bind/zones/db.home.lan.zone

..  code-block:: shell

    root@mksnanopineo2:~# cat /etc/bind/zones/db.home.lan.zone
    ;
    ; BIND data file for mksnanopineo2.lan
    ;
    $TTL	604800
    @	IN	SOA	home.lan. root.home.lan. (
			      3		; Serial
			 604800		; Refresh
			  86400		; Retry
 			2419200		; Expire
			 604800 )	; Negative Cache TTL
    ;
    ; name servers - NS records
      IN      NS      mksnanopineo2.home.lan.

    ; name servers - A records
    mksnanopineo2.home.lan.          IN      A       192.168.0.130
    mksowrtlan.home.lan.             IN      A       192.168.0.1
    mksmikrotik.home.lan.            IN      A       192.168.0.218
    mksnetgear.home.lan.             IN      A       192.168.0.157
    root@mksnanopineo2:~#
