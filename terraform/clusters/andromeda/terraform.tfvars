# Shared configuration
cluster_name    = "andromeda"

ssh_private_key = "~/.ssh/id_rsa"
ssh_public_key  = "~/.ssh/id_rsa.pub"

# Rancher configuration
rancher_api_url     = "https://rancher.nostran.com/v3"

etcd_backup_enabled = false

# NOTE: Disabled by default because monitoring/alerting via Prometheus
# consumes a lot of cpu/memory by default  (750 MB RAM and 750 millicore CPU)
enable_cluster_monitoring = false
enable_cluster_alerting = false

# Hetzner Cloud configuration
ansible_playbook_path       = "../../../ansible/provision.yml"
ansible_vault_password_path = "~/.solakube/ansible-vault-pass"

#
# The definition of teh virtual machines forming the Kubernetes nodes
# (see variables.tf for detailed docs)
#
# cx21  - 2 vCPU |  4 GB RAM |  40 GB SSD |  4.9 EUR
# cx31  - 2 vCPU |  8 GB RAM |  40 GB SSD |  8.9 EUR
# cpx31 - 4 vCPU |  8 GB RAM | 160 GB SSD | 12.4 EUR
#
servers = {

  1 = {
    name               = "andromeda-master-1"
    private_ip_address = "10.0.0.3"
    server_type        = "cx31"
    image              = "centos-7"
    location           = "nbg1"
    backups            = false
    user_data_script   = "centos7_generic"
    roles              = "--worker --etcd --controlplane"
  },

  2 = {
    name               = "andromeda-master-2"
    private_ip_address = "10.0.0.4"
    server_type        = "cx31"
    image              = "centos-7"
    location           = "nbg1"
    backups            = false
    user_data_script   = "centos7_generic"
    roles              = "--worker --etcd --controlplane"
  },

  3 = {
    name               = "andromeda-master-3"
    private_ip_address = "10.0.0.5"
    server_type        = "cx31"
    image              = "centos-7"
    location           = "nbg1"
    backups            = false
    user_data_script   = "centos7_generic"
    roles              = "--worker --etcd --controlplane"
  },
}

