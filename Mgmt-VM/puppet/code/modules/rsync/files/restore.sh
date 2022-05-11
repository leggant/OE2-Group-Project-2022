#!/bin/bash

#Hosts
db=db-b.foo.org.nz
mgmt=mgmt-b.foo.org.nz
backup=backup-b.foo.org.nz
app=app-b.foo.org.nz

host=$(hostname)
if [ $host == $mgmt ]
then

BDIR="
/etc/node-exporter
/etc/nagios
/etc/nagios3
/etc/nagios-plugins
/etc/puppet/code
/etc/puppet/puppet.conf
"

# excludes file - this contains a wildcard pattern per line of files to exclude
EXCLUDES="$HOME/cron/excludes"
INCLUDE="$HOME/test/*.txt"
# the name of the backup machine
BSERVER=groupb
USERX=restore-b.foo.org.nz
BACKUPDIR=`date +%d-%m-%Y-%H-%M-%S`
OPTS="-haAXuv -v  --log-file=/home/$USER/log.log --backup-dir=~/backup/mgmt/backup-$BACKUPDIR" 

for d in $BDIR;do
rsync $OPTS $d $BSERVER@$USERX:~/backup/mgmt
done


#=========================================================================
elif [ $host == $db ]
then
echo " db vm"

BDIR=""
# the name of the backup machine
BSERVER=groupb
USERX=restore-b.foo.org.nz
BACKUPDIR=`date +%d-%m-%Y-%H-%M-%S`
OPTS="-haAXuv -v --exclude --log-file=/home/$USER/log.log --backup-dir=~/backup/db/backup-$BACKUPDIR"

for d in $BDIR;do
rsync $OPTS $d $BSERVER@$USERX:~/backup/db
done
#==========================================================================
elif [ $host == $app ]
then
echo " app vm"

BDIR="
/etc/apache2
/var/www/owncloud/data
"

sudo chmod o+rx /var/www/owncloud/data -R
 
BSERVER=groupb
USERX=restore-b.foo.org.nz
BACKUPDIR=`date +%d-%m-%Y-%H-%M-%S`
OPTS="-haAXuv -v --exclude --log-file=/home/$USER/log.log --backup-dir=~/backup/app/backup-$BACKUPDIR"

for d in $BDIR;do
rsync $OPTS $d $BSERVER@$USERX:~/backup/app
done
sudo chmod o-rx /var/www/owncloud/data -R
else [ $host == $backup ]

echo " backup vm"

fi
