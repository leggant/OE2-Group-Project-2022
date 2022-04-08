

# OE2-Group-Project

## VM Setup

To add an alias, run `sudo vi ~/.bashrc` at the end of the file under `# Custom Aliases` add `alias name='commands'` save and close. Then, run `sudo source=~/bashrc`

### Mgmt-B VM

1. Run Agent Update: *agentupdate*
   `alias agentupdate='sudo puppet agent --server=mgmt-b.foo.org.nz --no-daemonize --verbose --onetime'`
2. Edit Site.pp: *site* 
   `alias site='sudo vi /etc/puppet/code/environments/production/manifests/site.pp'`
3. `alias mod='cd /etc/puppet/code/modules/'`
4. `alias nag='mod && cd nagios'`
5. `alias res='sudo systemctl restart'`
6. `alias stat='sudo systemctl status'`
7. `alias inst='apt list | grep'`
8. `alias resmas='sudo systemctl restart puppetmaster'`
9. `alias statmas='sudo systemctl status puppetmaster'`
10. `alias respup='sudo systemctl restart puppet'`
11. `alias statpup='sudo systemctl status puppet'`
12. `alias lcert='sudo puppet cert --list --all'`
13. `alias sign='sudo puppet cert --sign'`
14. `alias statnr='sudo systemctl status nagios-nrpe-server'`
15. `alias resnr='sudo systemctl restart nagios-nrpe-server'`
16. `alias statnag='sudo systemctl status nagios3'`
17. `alias resnag='sudo systemctl restart nagios3'`
18. `alias ernag='sudo nagios3 -v /etc/nagios3/nagios.cfg'` *get error output from nagios*
19. `bumgmt` alias to backup VM to OE2-Group-Project/Mgmt-VM/ : *bumgmt* 
    `alias bumgmt='cd ~/OE2-Group-Project && git pull && sudo cp /etc/puppet/ -r ~/OE2-Group-Project/Mgmt-VM/ -r && sudo rm -r ~/OE2-Group-Project/Mgmt-VM/puppet/ssl && sudo cp /etc/puppet/code/environments/production/manifests/site.pp ~/OE2-Group-Project/Mgmt-VM/puppet/ && sudo chown bitstudent ~/OE2-Group-Project/Mgmt-VM/puppet/code && sudo chgrp bitstudent ~/OE2-Group-Project/Mgmt-VM/puppet && sudo chown bitstudent ~/OE2-Group-Project/Mgmt-VM/puppet/* && sudo chgrp bitstudent ~/OE2-Group-Project/Mgmt-VM/puppet/* && sudo cp /etc/hosts ~/OE2-Group-Project/Mgmt-VM/hosts && sudo chown bitstudent ~/OE2-Group-Project/Mgmt-VM/hosts && sudo chgrp bitstudent ~/OE2-Group-Project/Mgmt-VM/hosts && sudo chmod go+r ~/OE2-Group-Project/Mgmt-VM/hosts && sudo cp /etc/nagios3 -r ~/OE2-Group-Project/Mgmt-VM/ -r && sudo chown bitstudent ~/OE2-Group-Project/Mgmt-VM/nagios3 && sudo chgrp bitstudent ~/OE2-Group-Project/Mgmt-VM/nagios3 && sudo chown bitstudent ~/OE2-Group-Project/Mgmt-VM/nagios3/* && sudo chgrp bitstudent ~/OE2-Group-Project/Mgmt-VM/nagios3/* && sudo cp /etc/php/7.2/cgi/php.ini ~/OE2-Group-Project/Mgmt-VM/php.ini && sudo chown bitstudent ~/OE2-Group-Project/Mgmt-VM/php.ini && sudo chgrp bitstudent ~/OE2-Group-Project/Mgmt-VM/php.ini && history -w && sudo cp ~/.bash_history ~/OE2-Group-Project/Mgmt-VM/bash_history.txt && sudo chown bitstudent ~/OE2-Group-Project/Mgmt-VM/bash_history.txt && sudo chgrp bitstudent ~/OE2-Group-Project/Mgmt-VM/bash_history.txt && sudo chmod go+r ~/OE2-Group-Project/Mgmt-VM/bash_history.txt && sudo cp ~/.bashrc ~/OE2-Group-Project/Mgmt-VM/bashrc && sudo chown bitstudent ~/OE2-Group-Project/Mgmt-VM/bashrc && sudo chgrp bitstudent ~/OE2-Group-Project/Mgmt-VM/bashrc && sudo chmod go+r ~/OE2-Group-Project/Mgmt-VM/bashrc && sudo cp /etc/nagios ~/OE2-Group-Project/Mgmt-VM/ -r && sudo cp /etc/nagios-plugins ~/OE2-Group-Project/Mgmt-VM/ -r && cd ~/OE2-Group-Project && git status'`


### Db-B VM

1. alias to backup VM to OE2-Group-Project/Db-VM/ : *budb*
   `alias budb='cd ~/OE2-Group-Project && git pull && sudo cp /etc/puppet/ ~/OE2-Group-Project/Db-VM/ -r && sudo cp /etc/hosts ~/OE2-Group-Project/Db-VM/hosts && sudo chown bitstudent ~/OE2-Group-Project/Db-VM/hosts && sudo chgrp bitstudent ~/OE2-Group-Project/Db-VM/hosts && sudo chmod go+r ~/OE2-Group-Project/Db-VM/hosts && sudo cp /etc/puppet/ ~/OE2-Group-Project/Db-VM/ -r && history -w && sudo cp ~/.bash_history ~/OE2-Group-Project/Db-VM/bash_history.txt && sudo chown bitstudent ~/OE2-Group-Project/Db-VM/bash_history.txt && sudo chgrp bitstudent ~/OE2-Group-Project/Db-VM/bash_history.txt && sudo chmod go+r ~/OE2-Group-Project/Db-VM/bash_history.txt && sudo cp ~/.bashrc ~/OE2-Group-Project/Db-VM/bashrc && sudo chown bitstudent ~/OE2-Group-Project/Db-VM/bashrc && sudo chgrp bitstudent ~/OE2-Group-Project/Db-VM/bashrc && sudo chmod go+r ~/OE2-Group-Project/Db-VM/bashrc && sudo cp /etc/mysql ~/OE2-Group-Project/Db-VM/ -r && sudo chgrp bitstudent ~/OE2-Group-Project/Db-VM/mysql/debian.cnf && sudo chown bitstudent ~/OE2-Group-Project/Db-VM/mysql/debian.cnf && sudo cp /etc/nagios ~/OE2-Group-Project/Db-VM -r && sudo cp /etc/nagios-plugins ~/OE2-Group-Project/Db-VM -r && cd ~/OE2-Group-Project && git status'`
2. `alias pup='cd /etc/puppet'`
3. `alias res='sudo systemctl restart'`
4. `alias stat='sudo systemctl status'`
5. `alias inst='apt list | grep'`
6. `alias respup='sudo systemctl restart puppet'`
7. `alias statpup='sudo systemctl status puppet'`
8. `alias statnr='sudo systemctl status nagios-nrpe-server'`
9. `alias resnr='sudo systemctl restart nagios-nrpe-server'`

### App-B VM

1. `alias buapp='cd ~/OE2-Group-Project && git pull && sudo cp /etc/puppet/ ~/OE2-Group-Project/App-VM/ -r && sudo cp /etc/hosts ~/OE2-Group-Project/App-VM/hosts && sudo chown bitstudent ~/OE2-Group-Project/App-VM/hosts && sudo chgrp bitstudent ~/OE2-Group-Project/App-VM/hosts && sudo chmod go+r ~/OE2-Group-Project/App-VM/hosts && sudo cp /etc/puppet/ ~/OE2-Group-Project/App-VM/ -r && history -w && sudo cp ~/.bash_history ~/OE2-Group-Project/App-VM/bash_history.txt && sudo chown bitstudent ~/OE2-Group-Project/App-VM/bash_history.txt && sudo chgrp bitstudent ~/OE2-Group-Project/App-VM/bash_history.txt && sudo chmod go+r ~/OE2-Group-Project/App-VM/bash_history.txt && sudo cp ~/.bashrc ~/OE2-Group-Project/App-VM/bashrc && sudo chown bitstudent ~/OE2-Group-Project/App-VM/bashrc && sudo chgrp bitstudent ~/OE2-Group-Project/App-VM/bashrc && sudo chmod go+r ~/OE2-Group-Project/App-VM/bashrc && sudo cp /etc/nagios ~/OE2-Group-Project/App-VM -r && sudo cp /etc/nagios-plugins ~/OE2-Group-Project/App-VM -r && cd ~/OE2-Group-Project && git status'`
2. `alias pup='cd /etc/puppet'`
3. `alias mod='cd /etc/puppet/code/module'`
4. `alias res='sudo systemctl restart'`
5. `alias stat='sudo systemctl status'`
6. `alias inst='apt list | grep'`
7. `alias respup='sudo systemctl restart puppet'`
8. `alias statpup='sudo systemctl status puppet'`
9. `alias statnr='sudo systemctl status nagios-nrpe-server'`
10. `alias resnr='sudo systemctl restart nagios-nrpe-server'`

### Backup-B VM

1. `alias bubup='cd ~/OE2-Group-Project && sudo git pull && sudo cp /etc/puppet ~/OE2-Group-Project/Backup-VM/ -r && sudo cp /etc/hosts ~/OE2-Group-Project/Backup-VM/hosts && sudo chown bitstudent ~/OE2-Group-Project/Backup-VM/hosts && sudo chgrp bitstudent ~/OE2-Group-Project/Backup-VM/hosts && sudo chmod go+r ~/OE2-Group-Project/Backup-VM/hosts && sudo cp /etc/puppet/ ~/OE2-Group-Project/Backup-VM/ -r && history -w && sudo cp ~/.bash_history ~/OE2-Group-Project/Backup-VM/bash_history.txt && sudo chown bitstudent ~/OE2-Group-Project/Backup-VM/bash_history.txt && sudo chgrp bitstudent ~/OE2-Group-Project/Backup-VM/bash_history.txt && sudo chmod go+r ~/OE2-Group-Project/Backup-VM/bash_history.txt && sudo cp ~/.bashrc ~/OE2-Group-Project/Backup-VM/bashrc && sudo chown bitstudent ~/OE2-Group-Project/Backup-VM/bashrc && sudo chgrp bitstudent ~/OE2-Group-Project/Backup-VM/bashrc && sudo chmod go+r ~/OE2-Group-Project/Backup-VM/bashrc && sudo cp /etc/nagios ~/OE2-Group-Project/Backup-VM -r && sudo cp /etc/nagios-plugins ~/OE2-Group-Project/Backup-VM -r && cd ~/OE2-Group-Project && git status'`
2. `alias pup='cd /etc/puppet'`
3. `alias res='sudo systemctl restart'`
4. `alias stat='sudo systemctl status'`
5. `alias inst='apt list | grep'`
6. `alias respup='sudo systemctl restart puppet'`
7. `alias statpup='sudo systemctl status puppet'`
8. `alias statnr='sudo systemctl status nagios-nrpe-server'`