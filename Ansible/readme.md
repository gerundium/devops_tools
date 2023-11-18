# Install Docker via Ansible

## TL;DR

```bash
ansible-galaxy collection install -r prerequisites/requirements.yml

ansible-playbook playbooks/install_docker.yaml --inventory-file inventoiries/hosts
```

## Run Ansible in a Docker container

```bash
# --
# Parameters:
# rm: ephemeral container
#  v: volume to mount
#  w: working directory
#  c: command
#  i: inventory file
# --
docker run --rm -v ./examples:/examples -w /examples eiboo9uu/dbc-ansible:v20230625-1 /bin/bash -c "ansible-playbook -i example-inventory.ini example-playbook-ping.yaml"

```
