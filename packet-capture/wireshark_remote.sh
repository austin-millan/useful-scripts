#!/bin/sh

# Runs `tcpdump` on remote, redirects stream  local filesystem, then runs Wireshark on packet
# stream.

remote_host="<YOUR_HOST>"

rm -f /tmp/wire
mkfifo /tmp/wire
ssh $remote_host  "sudo /usr/sbin/tcpdump -s 0 -U -n -w - -i any" > /tmp/wire &
sudo wireshark -k -i /tmp/wire 2> /dev/null &
