# kubernetes-failover-demo

## Create VM template

1. Install Hashicorp's Packer
1. `cd vm`
1. Download the plugin: `packer init .`
1. Format and validate: `packer fmt .` followed by `packer validate .`
1. Build: `packer build parallels-ubuntu-server.pkr.hcl`

## Deploy

1. Ensure room1 and room2 are known hosts
1. Install Ansible
1. Run `ansible-playbook deployment/k3stasks.yaml --ask-vault-pass`

## Vaulted vars

1. Create ./host_vars/HOST directories (one per HOST)
1. In each HOST directory, run `ansible-vault create crypted`
1. Fill the files with: `vaulted_become_pass: HOST_BECOME_PASSWORD`, replacing HOST_BECOME_PASSWORD with the correct value
1. Create a `plain` file per HOST
1. Fill them with: `ansible_become_pass: "{{ vaulted_become_pass }}"`

# Extra

## Ubuntu Server autoinstall (wip)

1. create `cidata` dir
1. inside it, create `user-data` and `meta-data` file. Check `vm/cidata` for examples
1. create image
