Routers Configuration
#####################

:date: 2024-10-01 19:50
:tags: cybersecurity, diy, it, hacking
:category: cybersecurity, diy, it, hacking
:slug: Routers Configuration
:authors: Klimenko Maxim Sergievich
:summary: Routers Configuration

#####################

Setup power supply and EMF protected box, install diferent boxes for supply and computers and routers:

.. image:: images/photo_2024-10-01_19-04-59.jpg
           :align: left

.. image:: images/photo_2024-10-01_19-04-48.jpg
           :align: left

.. image:: images/photo_2024-10-01_19-04-33.jpg
           :align: left

Im still use `OpenWrt`_, from 2021 on this board:

.. _OpenWrt: https://openwrt.org/start

.. image:: images/img-2024-10-01-180755.png
           :align: left

DIY part of power supply, other is separated Chieftec PSU:
		   
.. image:: images/images/2024-09-26-19-14-06-586.jpg
           :align: left

Firewall - rules for netfiler and BPF: 

.. image:: images/img-2024-10-01-184048.png
           :align: left

Monitoring: exporter on board to Prometheus and from DB to Grafana:

.. image:: images/2020-12-15-191648_2048x1152_scrot.png
           :align: left

Drop Intel `AMT`_ comm

OpenWrt

.. image:: images/2023-01-24_19-48-r.png
	   :align: left


.. _AMT: https://software.intel.com/sites/manageability/AMT_Implementation_and_Reference_Guide/default.htm?turl=WordDocuments%2Fkvmandintelamt.htm

