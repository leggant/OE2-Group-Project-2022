

# OE2-Group-Project

## Aliases

To add an alias, run `sudo vi ~/.bashrc` at the end of the file under `# Custom Aliases` add `alias name='commands'` save and close. Then, run `sudo source=~/bashrc`

### Mgmt-B VM

1. Run Agent Update: *agentupdate*
   `alias agentupdate='sudo puppet agent --server=mgmt-b.foo.org.nz --no-daemonize --verbose --onetime'`
2. Edit Site.pp: *site* 
   `alias site='sudo vi /etc/puppet/code/environments/production/manifests/site.pp'`
3. alias to backup VM to OE2-Group-Project/Mgmt-VM/ : *cpmgmt*
   ```bash
   alias cpmgmt='sudo cp /etc/puppet/code/environments/production/manifests/site.pp ~/OE2-Group-Project/Mgmt-VM/ && sudo cp /etc/hosts ~/OE2-Group-Project/Mgmt-VM/Config/hosts && sudo chown bitstudent ~/OE2-Group-Project/Mgmt-VM/Config/hosts && sudo chgrp bitstudent ~/OE2-Group-Project/Mgmt-VM/Config/hosts && sudo chmod go+r ~/OE2-Group-Project/Mgmt-VM/Config/hosts && sudo cp /etc/puppet/code/modules/ ~/OE2-Group-Project/Mgmt-VM/ -r && history -w && sudo cp ~/.bash_history ~/OE2-Group-Project/Mgmt-VM/bash_history.txt && sudo chown bitstudent ~/OE2-Group-Project/Mgmt-VM/bash_history.txt && sudo chgrp bitstudent ~/OE2-Group-Project/Mgmt-VM/bash_history.txt && sudo chmod go+r ~/OE2-Group-Project/Mgmt-VM/bash_history.txt && sudo cp ~/.bashrc ~/OE2-Group-Project/Mgmt-VM/bashrc.txt && sudo chown bitstudent ~/OE2-Group-Project/Mgmt-VM/bashrc.txt && sudo chgrp bitstudent ~/OE2-Group-Project/Mgmt-VM/bashrc.txt && sudo chmod go+r ~/OE2-Group-Project/Mgmt-VM/bashrc.txt && cd ~/OE2-Group-Project && git status'

### Db-B VM

1. alias to backup VM to OE2-Group-Project/Db-VM/ : *budb*

```bash
alias budb='sudo cp /etc/puppet/ ~/OE2-Group-Project/Db-VM/ -r && sudo cp /etc/hosts ~/OE2-Group-Project/Db-VM/hosts && sudo chown bitstudent ~/OE2-Group-Project/Db-VM/hosts && sudo chgrp bitstudent ~/OE2-Group-Project/Db-VM/hosts && sudo chmod go+r ~/OE2-Group-Project/Db-VM/hosts && sudo cp /etc/puppet/ ~/OE2-Group-Project/Db-VM/ -r && history -w && sudo cp ~/.bash_history ~/OE2-Group-Project/Db-VM/bash_history.txt && sudo chown bitstudent ~/OE2-Group-Project/Db-VM/bash_history.txt && sudo chgrp bitstudent ~/OE2-Group-Project/Db-VM/bash_history.txt && sudo chmod go+r ~/OE2-Group-Project/Db-VM/bash_history.txt && sudo cp ~/.bashrc ~/OE2-Group-Project/Db-VM/bashrc.txt && sudo chown bitstudent ~/OE2-Group-Project/Db-VM/bashrc.txt && sudo chgrp bitstudent ~/OE2-Group-Project/Db-VM/bashrc.txt && sudo chmod go+r ~/OE2-Group-Project/Db-VM/bashrc.txt && cd ~/OE2-Group-Project && git status'
```

