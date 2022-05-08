#!/bin/bash

# Include
sudo cp /etc/puppet/
sudo rm -r ~/OE2-Group-Project/Mgmt-VM/puppet/ssl
sudo cp /etc/puppet/code/environments/production/manifests/site.pp ~/OE2-Group-Project/Mgmt-VM/puppet/
sudo cp /etc/hosts ~/OE2-Group-Project/Mgmt-VM/hosts
sudo chmod go+r ~/OE2-Group-Project/Mgmt-VM/hosts
sudo cp /etc/nagios3 -r ~/OE2-Group-Project/Mgmt-VM/ -r
sudo cp /etc/php/7.2/cgi/php.ini ~/OE2-Group-Project/Mgmt-VM/php.ini
sudo cp ~/.bash_history ~/OE2-Group-Project/Mgmt-VM/bash_history.txt
sudo chmod go+r ~/OE2-Group-Project/Mgmt-VM/bash_history.txt
sudo cp ~/.bashrc ~/OE2-Group-Project/Mgmt-VM/bashrc
sudo chmod go+r ~/OE2-Group-Project/Mgmt-VM/bashrc
sudo cp /etc/nagios ~/OE2-Group-Project/Mgmt-VM -r
sudo cp /etc/nagios-plugins ~/OE2-Group-Project/Mgmt-VM -r
sudo cp /etc/prometheus-plugins ~/OE2-Group-Project/Mgmt-VM/prometheus-plugins -r
sudo cp /etc/systemd/system/node-exporter.service ~/OE2-Group-Project/Mgmt-VM/prometheus-plugins/node-exporter.service
sudo chown -R bitstudent ~/OE2-Group-Project/Mgmt-VM
sudo chgrp -R bitstudent ~/OE2-Group-Project/Mgmt-VM
sudo chmod -R 775 ~/OE2-Group-Project/Scripts
cd ~/OE2-Group-Project


#Hosts
db=db-b.foo.org.nz
mgmt=mgmt-b.foo.org.nz
backup=backup-b.foo.org.nz
app=app-b.foo.org.nz


host=$(hostname)
if [ $host == $db ]
then
echo "This is db"
# This script does personal backups to a rsync backup server. You will end up
# with a 7 day rotating incremental backup. The incrementals will go
# into subdirectories named after the day of the week, and the current
# full backup goes into a directory called "current"
# tridge@linuxcare.com

# directory to backup
BDIR=/home/$USER

# excludes file - this contains a wildcard pattern per line of files to exclude
EXCLUDES=$HOME/cron/excludes

# the name of the backup machine
BSERVER=owl

# your password on the backup server
export RSYNC_PASSWORD=XXXXXX


########################################################################

BACKUPDIR=`date +%A`
OPTS="--force --ignore-errors --delete-excluded --exclude-from=$EXCLUDES
      --delete --backup --backup-dir=/$BACKUPDIR -a"

export PATH=$PATH:/bin:/usr/bin:/usr/local/bin

# the following line clears the last weeks incremental directory
[ -d $HOME/emptydir ] || mkdir $HOME/emptydir
rsync --delete -a $HOME/emptydir/ $BSERVER::$USER/$BACKUPDIR/
rmdir $HOME/emptydir

# now the actual transfer
rsync $OPTS $BDIR $BSERVER::$USER/current


else
# another vm
fi
