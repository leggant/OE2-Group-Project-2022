#!/bin/sh

# pull down changes from the remote repo

cd ~/OE2-Group-Project
sudo git pull
cd ~/

# backup and set permissions on files

sudo cp /etc/puppet/ ~/OE2-Group-Project/Backup-VM/ -r
sudo cp /etc/hosts ~/OE2-Group-Project/Backup-VM/hosts
sudo chown bitstudent ~/OE2-Group-Project/Backup-VM/hosts
sudo chgrp bitstudent ~/OE2-Group-Project/Backup-VM/hosts
sudo chmod go+r ~/OE2-Group-Project/Backup-VM/hosts
sudo cp /etc/puppet/ ~/OE2-Group-Project/Backup-VM/ -r
history -w
sudo cp ~/.bash_history ~/OE2-Group-Project/Backup-VM/bash_history.txt
sudo chown bitstudent ~/OE2-Group-Project/Backup-VM/bash_history.txt
sudo chgrp bitstudent ~/OE2-Group-Project/Backup-VM/bash_history.txt
sudo chmod go+r ~/OE2-Group-Project/Backup-VM/bash_history.txt
sudo cp ~/.bashrc ~/OE2-Group-Project/Backup-VM/bashrc
sudo chown bitstudent ~/OE2-Group-Project/Backup-VM/bashrc
sudo chgrp bitstudent ~/OE2-Group-Project/Backup-VM/bashrc
sudo chmod go+r ~/OE2-Group-Project/Backup-VM/bashrc
sudo cp /etc/nagios ~/OE2-Group-Project/Backup-VM -r
sudo cp /etc/nagios-plugins ~/OE2-Group-Project/Backup-VM -r
cd ~/OE2-Group-Project

# check for file changes

if [ -z "$(git status --porcelain)" ]; then 
	# no changes to add to a commit
  cd ~/
else 
  COMMIT_TIMESTAMP=`date +'%d-%m-%Y %H:%M:%S %Z'`
  git status
  git add .
  git commit -m "backup: automated system backup" -m "completed: $COMMIT_TIMESTAMP" -m "backup-b"
  git push
  cd ~/
fi
