#!/bin/sh

########## CONFIG #########
SNIFF_PIPE=/tmp/sniff
ROUTER_IP=1.0.0.1
ROUTER_IFACE=br-lan
###########################

if [ -f $PIPE ];
then
   echo "$PIPE exists."
else
   echo "File $PIPE does not exist. Creating..."
   mkfifo $PIPE
fi

echo "Starting capture on $ROUTER_IP"
ssh root@$ROUTER_IP "tcpdump -i $ROUTER_IFACE -s 0 -U -w - not port 22" > $SNIFF_PIPE

echo "Launching Wireshark"
wireshark -k -i $SNIFF_PIPE

