#!/bin/bash

# Include

#Hosts
db=db-b.foo.org.nz
mgmt=mgmt-b.foo.org.nz
backup=backup-b.foo.org.nz
app=app-b.foo.org.nz


host=$(hostname)
if [ $host == $mgmt ]
then
echo "This is db"
# This script does personal backups to a rsync backup server. You will end up
# with a 7 day rotating incremental backup. The incrementals will go
# into subdirectories named after the day of the week, and the current
# full backup goes into a directory called "current"
# tridge@linuxcare.com

# directory to backup
BDIR=/home/$USER/test

# excludes file - this contains a wildcard pattern per line of files to exclude
EXCLUDES=$HOME/cron/excludes

# the name of the backup machine
BSERVER=groupb
Hostx=restore-b.foo.org.nz
# your password on the backup server
#export RSYNC_PASSWORD=XXXXXX


########################################################################

BACKUPDIR=`date +%d-%m-%Y`
OPTS="--force --ignore-errors --include="$BDIR"  --delete-excluded --exclude-from=$EXCLUDES
      --delete --backup --backup-dir=/$BACKUPDIR -a"

export PATH=$PATH:/bin:/usr/bin:/usr/local/bin

# the following line clears the last weeks incremental directory
[ -d $HOME/emptydir ] || mkdir $HOME/emptydir
rsync --delete -a $HOME/emptydir/ $BSERVER::$Hostx/backup/mgmt/$BACKUPDIR/
rmdir $HOME/emptydir

# now the actual transfer
rsync $OPTS  $BSERVER::$Hostx/backup/mgmt


else
echo "another vm"
fi
