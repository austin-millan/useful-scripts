#!/bin/bash

# Get packets per second on an interface.
# The loop gets the current number of packets, sleeps for 1s, then displays the
# difference of packets.

time="1"
iface="eth0"

while true
	do
		txpkts_old="`cat /sys/class/net/$iface/statistics/tx_packets`" # sent packets
		rxpkts_old="`cat /sys/class/net/$iface/statistics/rx_packets`" # recv packets
			sleep $time
		txpkts_new="`cat /sys/class/net/$iface/statistics/tx_packets`" # sent packets
                rxpkts_new="`cat /sys/class/net/$iface/statistics/rx_packets`" # recv packets
		txpkts="`expr $txpkts_new - $txpkts_old`"		     # evaluate expressions for sent packets
		rxpkts="`expr $rxpkts_new - $rxpkts_old`"		     # evaluate expressions for recv packets
			echo "tx $txpkts pkts/s - rx $rxpkts pkts/ on interface $iface"
	done
