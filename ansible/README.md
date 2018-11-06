# Directory containing ansible related stuff

### Getting ansible to run on coreos:
First we need to bootstrap the coreos nodes with python by downloading a role from ansible galaxy:
Inside this folder:
```
ansible-galaxy install defunctzombie.coreos-bootstrap -p ./roles
```
Then bootstrap the nodes (remember to add the new hosts to the hosts.yml file):
```
ansible-playbok -i hosts.yml bootstrap.yml
```

### Running backups on the hosts:
```
ansible-playbook -i hosts.yml backup.yml
```

### Fetching backups from hosts:
```
ansible-playbook -i hosts.yml copy_bakcups.yml
```
