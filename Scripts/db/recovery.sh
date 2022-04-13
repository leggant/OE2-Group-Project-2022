#!/bin/sh




sudo apt update
sudo apt install mysql-client
sudo mysql --user=root --password=P@ssw0rd -e "create database if not exists testcloud;" 
sudo mysql -e "grant all on testcloud.* to 'testcloud'@'app-b.foo.org.nz' identified by 'P@ssw0rd';" 
sudo mysql -e "flush privileges;" 


# check for file changes

#if [ -z "$(git status --porcelain)" ]; then 
	# no changes to add to a commit
#$ cd ~/
#else 
 # COMMIT_TIMESTAMP=`date +'%d-%m-%Y %H:%M:%S %Z'`
  #git status
  #git add .
  #git commit -m "mgmt: automated system backup" -m "completed: $COMMIT_TIMESTAMP" -m "mgmt-b"
  #git push
  #cd ~/
#fi
