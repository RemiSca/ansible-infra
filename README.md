# ansible-infra

## Starting the infrastructure

Clone the project and go to it

Make directories for the user at the root of the project:
```
mkdir user
```

```
docker-compose up --build -d --remove-orphans
```

Ansible is configured to accept any ssh keys in ansible.cfg

```
host_key_checking=False
```