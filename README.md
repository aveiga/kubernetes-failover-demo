# kubernetes-failover-demo

## Create VM template

This will provision an AWS AMI based on the official Ubuntu Server 20.04 AMI, to be used as template by Terraform (see the `Create VMs` section):

1. Install Hashicorp's Packer
1. `cd vm-templates`
1. Download the plugin: `packer init .`
1. Format and validate: `packer fmt .` followed by `packer validate .`
1. Build: `packer build aws-ubuntu-server.pkr.hcl`

## Create VMs

This will provision a number of AWS EC2 instances:

1. Install Terraform
1. `cd vm-provisioning`
1. `terraform init`
1. `terraform plan`
1. `terraform apply`

### Delete the VMs

1. `terraform destroy`

## Deploy k3s

1. Install Ansible
1. `cd k3s`
1. Copy ssh keys: `ansible-playbook ssh-key-tasks.yaml --ask-vault-pass --ask-pass`. This shouldn't be needed when creating the VMs with Terraform. To be tested.
1. Run `ansible-playbook k3stasks.yaml --ask-vault-pass`. This will use the `ansible.cfg` configuration file, which is defining the hosts file

## Cleanup

1. `ansible-playbook k3suninstall.yaml --ask-vault-pass`
1. Delete the `kine` table from the `kubernetes` PostgreSQL Control Plane DB

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
1. create image, using the following packer parallels ubuntu builder config:

```
floppy_files           = ["./cidata/meta-data", "./cidata/user-data"]
floppy_label         = "CIDATA"
```
