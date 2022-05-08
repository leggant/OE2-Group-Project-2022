#!/bin/bash


#Hosts
db=db-b.foo.org.nz
mgmt=mgmt-b.foo.org.nz
backup=backup-b.foo.org.nz
app=app-b.foo.org.nz


host=$(hostname)
if [ $host == $mgmt ]
then

# This script does personal backups to a rsync backup server. You will end up
# with a 7 day rotating incremental backup. The incrementals will go
# into subdirectories named after the day of the week, and the current
# full backup goes into a directory called "current"
BDIR=(/home/$USER/test /home/$USER/)

# excludes file - this contains a wildcard pattern per line of files to exclude
EXCLUDES=$HOME/cron/excludes

# the name of the backup machine
BSERVER=groupb

# your password on the backup server
export RSYNC_PASSWORD=XXXXXX


########################################################################
USERX=restore-b.foo.org.nz
BACKUPDIR=`date +%A`
OPTS="--force --ignore-errors --delete-excluded --exclude-from=$EXCLUDES
      --delete --backup --backup-dir=/$BACKUPDIR -a"

export PATH=$PATH:/bin:/usr/bin:/usr/local/bin

# the following line clears the last weeks incremental directory
[ -d $HOME/emptydir ] || mkdir $HOME/emptydir
rsync --delete -a $HOME/emptydir/ $BSERVER@$USERX:~/backup/mgmt/$BACKUPDIR/
rmdir $HOME/emptydir

# now the actual transfer
rsync $OPTS $BDIR $BSERVER@$USERX:~/backup/mgmt


else
echo " another vm"
fi
