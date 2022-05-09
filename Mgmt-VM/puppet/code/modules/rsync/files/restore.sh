#!/bin/bash

#Hosts
db=db-b.foo.org.nz
mgmt=mgmt-b.foo.org.nz
backup=backup-b.foo.org.nz
app=app-b.foo.org.nz

host=$(hostname)
if [ $host == $mgmt ]
then

BDIR="/home/$USER/test /home/$USER/s"

# excludes file - this contains a wildcard pattern per line of files to exclude
EXCLUDES="$HOME/cron/excludes"
INCLUDE="$HOME/test/*.txt"
# the name of the backup machine
BSERVER=groupb
USERX=restore-b.foo.org.nz
BACKUPDIR=`date +%d-%m-%Y-%H-%M-%S`
OPTS=" --backup –ignore-existing --delete -v --dry-run  --backup-dir=~/backup/mgmt/changed-$BACKUPDIR -a"

for d in $BDIR;do
rsync $OPTS $d $BSERVER@$USERX:~/backup/mgmt
done

else
echo " another vm"
fi
