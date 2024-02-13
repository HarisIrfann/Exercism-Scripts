#!/bin/bash

# monitoring free disk space

FU=$(df -h | egrep -v "Filesystem|tmpfs"| grep nvme0n1p2| awk '{ print $5}'| tr -d %)

TO="harisirfan836@gmail.com"
if [[ $FU -ge 80 ]]
then
	echo "Warning disk space is low"
else
	echo "All good Disk space is good - $FU % " | mail -s "Disk space alert to" $TO
fi	


	

