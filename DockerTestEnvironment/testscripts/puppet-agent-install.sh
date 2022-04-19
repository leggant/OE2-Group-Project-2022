#!/bin/bash

apt-get update
sudo apt-get install puppet

LINE=[agent]
LINE1=server=mgmt-b.foo.org.nz
FILE=/etc/puppet/puppet.conf

if
grep -qF "$LINE" "$FILE"; then
echo "already exists"
else
echo $LINE >> $FILE
echo "done"
fi

if
grep -qF "$LINE1" "$FILE"; then
echo "already exists"
else
sudo sed -i "/^\[agent]/a $LINE1" "$FILE"
echo "done"
fi

sudo puppet agent --server=mgmt-b.foo.org.nz --no-daemonize --verbose --onetime

sudo systemctl status puppet
