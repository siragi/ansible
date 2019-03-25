# ansible sample

all necessary files (conf, playbooks, roles and app) to prepare virtual servers named in 'inventory-dev' and get a simple python based webservice running 

## installation
1. install ansible at your ansible server called 'control'
2. create a file ~/.ansiblevaultpassword (acc. to the ansible.cfg) and put your own password for the ansibleencryption into
3. clone it or transfer code to the 'control' server (for example into /work/ansible)
4. create virtmachines (use ubuntu1804.iso) with a 'ansible' user at every server mentioned in file 'inventory-dev'
5. create ssh key for ansible user at 'control' server, and distribute the public-key using `ssh-copy-id ansible@servername`
6. adapt group_vars/all/vault and encrypt the vault using the description in the file itself

## usage
7. go into the ansible dir (on your ansible 'control' server) and try it out using:
`Usage: ansible-playbook [options] playbook.yml [playbook2 ...]`
8. all in one server setup: 
`ansible-playbook site.yml`
9. test it
`ansible-playbook playbooks/stack_status.yml`
you may have to install also python2 (depending on your ubuntu.iso)
`ansible-playbook playbooks/pretaskpython.yml`
10. use the app, gathering info from loadbalancer: `curl lb01`, `curl lb01/db` or direct from the two apache webserver eg.`curl app01`for a simple apache/wsgi response using the py-app. 
