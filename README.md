# cloudstack-vdi
A collection of helpful scripts to manage Apache CloudStack for VDI operations.

<b>IMPORTANT:</b> These scripts are made to work with the ACS Integrator API ``(Port 8096)``. Also, please make sure you install ``jq``.

`` sudo apt-get install jq``

Please make sure you specify an ``iptables`` rule for your IP address (so other people cannot access the Integrator API).

Something like this should do:

``iptables -I INPUT -p tcp -s YOUR_IP_HERE --dport 8096 -j ACCEPT``

``iptables -I INPUT -p tcp -s 0.0.0.0/0 --dport 8096 -j DROP``
