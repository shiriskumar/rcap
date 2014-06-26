# REMOTE SNIFF


mkfifo /tmp/sniff

Starting capture on router

ssh root@1.0.0.1 "tcpdump -i br-lan -s 0 -U -w - not port 22" > /tmp/sniff

run in second shell

wireshark -k -i /tmp/sniff