# cloudstack-vdi
A collection of helpful scripts to manage Apache CloudStack for VDI operations.

IMPORTANT: These scripts are made to work with the CloudStack Integrator API ``(Port 8096)``. Please make sure you specify an iptables rule for your IP address (so other people cannot access the Integrator API).

Something like this,

``iptables --append INPUT --match tcp --protocol tcp --src YOUR_IP_HERE --dst CLOUDSTACK_UI_IP --dport 8096 --jump ACCEPT``
