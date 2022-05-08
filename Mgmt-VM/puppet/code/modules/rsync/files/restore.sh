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

# excludes file - this contains a wildcard pattern per line of files to exclude

# the name of the backup machine
BSERVER=groupb
Hostx=restore-b.foo.org.nz



readonly BACKUP_DIRS=(/home/$USER/test)
  
readonly RSYNC_PROFILE="groupb@$Hostx"
readonly RSYNC_DEFAULTS="-avz"
LIST="/home/$USER/test"
backup_folders() {
  local DIR TARGET

  for d in $LIST; do
    rsync $RSYNC_DEFAULTS $d $RSYNC_PROFILE/backup/mgmt
  done
}

main() {
  backup_folders
}

main







# now the actual transfer
else
echo "another vm"
fi
