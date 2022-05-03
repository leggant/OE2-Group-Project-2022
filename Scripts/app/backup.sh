#!/bin/bash

# pull down changes from the remote repo

cd ~/OE2-Group-Project
git pull
cd ~/

# backup and set permissions on files

sudo cp /etc/puppet/ ~/OE2-Group-Project/App-VM/ -r
sudo cp /etc/hosts ~/OE2-Group-Project/App-VM/hosts
sudo chown bitstudent ~/OE2-Group-Project/App-VM/hosts
sudo chgrp bitstudent ~/OE2-Group-Project/App-VM/hosts
sudo chmod go+r ~/OE2-Group-Project/App-VM/hosts
sudo cp /etc/puppet/ ~/OE2-Group-Project/App-VM/ -r
sudo cp /etc/apache2/ ~/OE2-Group-Project/App-VM/ -r
sudo cp /etc/mysql/ ~/OE2-Group-Project/App-VM/ -r
sudo cp ~/.bash_history ~/OE2-Group-Project/App-VM/bash_history.txt
sudo chown bitstudent ~/OE2-Group-Project/App-VM/bash_history.txt
sudo chgrp bitstudent ~/OE2-Group-Project/App-VM/bash_history.txt
sudo chmod go+r ~/OE2-Group-Project/App-VM/bash_history.txt
sudo cp ~/.bashrc ~/OE2-Group-Project/App-VM/bashrc
sudo chown bitstudent ~/OE2-Group-Project/App-VM/bashrc
sudo chgrp bitstudent ~/OE2-Group-Project/App-VM/bashrc
sudo chmod go+r ~/OE2-Group-Project/App-VM/bashrc
sudo cp /etc/nagios ~/OE2-Group-Project/App-VM -r
sudo cp /etc/nagios-plugins ~/OE2-Group-Project/App-VM -r
cd ~/OE2-Group-Project

# check for file changes

if [ -z "$(git status --porcelain)" ]; then 
	# no changes to add to a commit
  cd ~/
else 
  COMMIT_TIMESTAMP=`date +'%d-%m-%Y %H:%M:%S %Z'`
  history -w
  git add .
  git commit -m "app: automated system backup" -m "completed: $COMMIT_TIMESTAMP" -m "app-b"
  git push
  cd ~/
fi
