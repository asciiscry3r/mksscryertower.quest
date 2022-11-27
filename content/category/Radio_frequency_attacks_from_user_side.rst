Radio frequency attacks from user side
######################################

:date: 2022-09-27 10:20
:modified: 2022-11-09 06:18
:tags: dew, cults, cybersecurity, military
:category: cybersecurity, crimes, radio, rf, hacking
:slug: Radio frequency attacks from user side
:authors: Klimenko/Tsikunkov Maxim Sergievich
:summary: Radio frequency attacks from user side

######################################

`Radio-frequency (RF) retroreflector attack (RFRA)`_ is an active electromagnetic side-channel attack that aims to leak the target's internal signals by irradiating the targeted device with a radio wave, where an attacker has embedded a malicious circuit (RF retroreflector) in the device in advance. As the retroreflector consists of small and cheap electrical elements, such as a field-effect transistor (FET) chip and a wire that can work as a dipole antenna, the reflector can be embedded into various kinds of electric devices that carry unencrypted, sensitive information;, e.g., keyboard, display monitor, microphone, speaker, USB, and so on. Only a few studies have addressed the RFRA. However, they did not evaluate the conditions for a successful attack scientifically, and therefore, assessing the feasibility of the RFRA remains an open issue. In the present study, we aim to evaluate the conditions for a successful RFRA, empirically, through extensive experiments. Understanding attack limitations should help to develop effective countermeasures against it. In particular, as the conditions for a successful attack, we studied the distance between the attacker and the target, and the target signal frequencies. Through the extensive experiments, using off-the-shelf hardware, including software-defined radio (SDR) equipment, we revealed that the required conditions for a successful attack are (1) up to a 10-Mbps of a target signal and (2) up to a distance of 10 meters. We also demonstrated that a USB keyboard, using USB low-speed (1.5 Mbps), is attackable, and we succeeded to eavesdrop typing. We conclude that the RFRA threat is realistic.

anod shield

.. image:: images/laptop-sar-levels.jpg
           :align: left

.. image:: images/AP_014.png
           :align: left

.. image:: images/3-Figure11-1.png
           :align: left

Images from:
https://wipl-d.com/laptop-with-inverted-f-antenna/
https://www.semanticscholar.org/paper/Comparison-study-of-electromagnetic-human-with-2.4-Guterman-Moreira/b4e077c9897fd99a247675d040cff51202e7b847


https://core.ac.uk/download/pdf/286963353.pdf

.. _Radio-frequency (RF) retroreflector attack (RFRA): https://www.usenix.org/conference/woot18/presentation/wakabayashi

https://transientspecialists.com/blogs/blog/bulk-current-injection-bci-test-equipment-methods-information

https://www.nature.com/articles/s44172-022-00014-7

https://www.dww.com/articles/microsoft-obtains-patent-for-use-of-human-body-as-power-and-data-transmitting-medium
