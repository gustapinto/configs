:: to enable the services again just swap the 'stop' for 'start'

net stop wuauserv  &:: windows update service
net stop bits  &:: background intelligent transfer service
net stop dosvc  &:: delivery optimization service
