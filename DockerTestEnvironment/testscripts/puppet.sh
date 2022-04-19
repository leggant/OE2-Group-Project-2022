#!/bin/sh

apt-get update
apt-get install puppet -y

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
sed -i "/^\[agent]/a $LINE1" "$FILE"
echo "done"
fi

puppet agent --server=mgmt-b.foo.org.nz --no-daemonize --verbose --onetime

#sudo systemctl status puppet
service puppet start
service puppet status