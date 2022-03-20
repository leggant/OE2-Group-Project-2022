

# OE2-Group-Project

## Aliases

To add an alias, run `sudo vi ~/.bashrc` at the end of the file under `# Custom Aliases` add `alias name='commands'` save and close. Then, run `sudo source=~/bashrc`

### Mgmt-B VM

1. Run Agent Update: *agentupdate*
   `alias agentupdate='sudo puppet agent --server=mgmt-b.foo.org.nz --no-daemonize --verbose --onetime'`
2. Edit Site.pp: *site* 
   `alias site='sudo vi /etc/puppet/code/environments/production/manifests/site.pp'`
3. alias to backup VM to OE2-Group-Project/Mgmt-VM/ : *bumgmt*
   ```bash
   alias bumgmt='cd ~/OE2-Group-Project && git pull && sudo cp /etc/puppet/ -r ~/OE2-Group-Project/Mgmt-VM/ -r && sudo rm -r ~/OE2-Group-Project/Mgmt-VM/puppet/ssl && sudo cp /etc/puppet/code/environments/production/manifests/site.pp ~/OE2-Group-Project/Mgmt-VM/puppet/ && sudo chown bitstudent ~/OE2-Group-Project/Mgmt-VM/puppet/code && sudo chgrp bitstudent ~/OE2-Group-Project/Mgmt-VM/puppet && sudo chown bitstudent ~/OE2-Group-Project/Mgmt-VM/puppet/* && sudo chgrp bitstudent ~/OE2-Group-Project/Mgmt-VM/puppet/* && sudo cp /etc/hosts ~/OE2-Group-Project/Mgmt-VM/hosts && sudo chown bitstudent ~/OE2-Group-Project/Mgmt-VM/hosts && sudo chgrp bitstudent ~/OE2-Group-Project/Mgmt-VM/hosts && sudo chmod go+r ~/OE2-Group-Project/Mgmt-VM/hosts && sudo cp /etc/nagios3 -r ~/OE2-Group-Project/Mgmt-VM/ -r && sudo chown bitstudent ~/OE2-Group-Project/Mgmt-VM/nagios3 && sudo chgrp bitstudent ~/OE2-Group-Project/Mgmt-VM/nagios3 && sudo chown bitstudent ~/OE2-Group-Project/Mgmt-VM/nagios3/* && sudo chgrp bitstudent ~/OE2-Group-Project/Mgmt-VM/nagios3/* && sudo cp /etc/php/7.2/cgi/php.ini ~/OE2-Group-Project/Mgmt-VM/php.ini && sudo chown bitstudent ~/OE2-Group-Project/Mgmt-VM/php.ini && sudo chgrp bitstudent ~/OE2-Group-Project/Mgmt-VM/php.ini && history -w && sudo cp ~/.bash_history ~/OE2-Group-Project/Mgmt-VM/bash_history.txt && sudo chown bitstudent ~/OE2-Group-Project/Mgmt-VM/bash_history.txt && sudo chgrp bitstudent ~/OE2-Group-Project/Mgmt-VM/bash_history.txt && sudo chmod go+r ~/OE2-Group-Project/Mgmt-VM/bash_history.txt && sudo cp ~/.bashrc ~/OE2-Group-Project/Mgmt-VM/bashrc.txt && sudo chown bitstudent ~/OE2-Group-Project/Mgmt-VM/bashrc.txt && sudo chgrp bitstudent ~/OE2-Group-Project/Mgmt-VM/bashrc.txt && sudo chmod go+r ~/OE2-Group-Project/Mgmt-VM/bashrc.txt && cd ~/OE2-Group-Project && git status'

### Db-B VM

1. alias to backup VM to OE2-Group-Project/Db-VM/ : *budb*

```bash
alias budb='cd ~/OE2-Group-Project && git pull && sudo cp /etc/puppet/ ~/OE2-Group-Project/Backup-VM/ -r && sudo cp /etc/hosts ~/OE2-Group-Project/Backup-VM/hosts && sudo chown bitstudent ~/OE2-Group-Project/Backup-VM/hosts && sudo chgrp bitstudent ~/OE2-Group-Project/Backup-VM/hosts && sudo chmod go+r ~/OE2-Group-Project/Backup-VM/hosts && sudo cp /etc/puppet/ ~/OE2-Group-Project/Backup-VM/ -r && history -w && sudo cp ~/.bash_history ~/OE2-Group-Project/Backup-VM/bash_history.txt && sudo chown bitstudent ~/OE2-Group-Project/Backup-VM/bash_history.txt && sudo chgrp bitstudent ~/OE2-Group-Project/Backup-VM/bash_history.txt && sudo chmod go+r ~/OE2-Group-Project/Backup-VM/bash_history.txt && sudo cp ~/.bashrc ~/OE2-Group-Project/Backup-VM/bashrc.txt && sudo chown bitstudent ~/OE2-Group-Project/Backup-VM/bashrc.txt && sudo chgrp bitstudent ~/OE2-Group-Project/Backup-VM/bashrc.txt && sudo chmod go+r ~/OE2-Group-Project/Backup-VM/bashrc.txt && cd ~/OE2-Group-Project && git status'
```

