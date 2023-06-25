# Install Docker via Ansible

## TL;DR

```bash
ansible-galaxy collection install -r prerequisites/requirements.yml

ansible-playbook playbooks/install_docker.yaml --inventory-file inventoiries/hosts
```

## Run Ansible in a Docker container

```bash
docker run --rm -v ./examples:/examples docker pull eiboo9uu/dbc-ansible:v20230625-1 /bin/bash -c "ansible-playbook -i /examples/example-inventory.ini examples/example-playbook-ping.yaml"
```
