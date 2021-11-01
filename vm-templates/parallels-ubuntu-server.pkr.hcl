packer {
  required_plugins {
    parallels = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/parallels"
    }
  }
}

source "parallels-pvm" "ubuntu" {
  guest_os_type          = "ubuntu"
  iso_url                = "~/Downloads/ubuntu-20.04.2-live-server-arm64.iso"
  iso_checksum           = "69460b49c6781a845ca561263af3850e107814ffb9c08a19555e819d49feef4c"
  floppy_files           = ["./cidata/meta-data", "./cidata/user-data"]
  floppy_label           = "CIDATA"
  parallels_tools_flavor = "lin"
  ssh_username           = "ubuntu"
  ssh_password           = "ubuntu"
  ssh_timeout            = "30s"
  shutdown_command       = "echo 'packer' | sudo -S shutdown -P now"
  boot_wait              = "1s"
}

build {
  name = "k8s-failover-demo"
  sources = [
    "source.parallels-pvm.ubuntu"
  ]
  //   provisioner "shell" {
  //     environment_vars = [
  //         "FOO=hello world",
  //     ]
  //     inline = [
  //         "echo Adding file to Docker Container",
  //         "echo \"FOO is $FOO\" > example.txt",
  //     ]
  //   }
}