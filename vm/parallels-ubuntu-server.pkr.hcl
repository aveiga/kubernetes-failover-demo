packer {
  required_plugins {
    parallels = {
    }
  }
}

source "parallels" "ubuntu" {
  "type": "parallels-iso",
  "guest_os_type": "ubuntu",
  "iso_url": "/Users/aveiga/Downloads/ubuntu-20.04.2-live-server-arm64.iso",
  "iso_checksum": "69460b49c6781a845ca561263af3850e107814ffb9c08a19555e819d49feef4c",
  "parallels_tools_flavor": "lin",
  "ssh_username": "ubuntu",
  "ssh_password": "ubuntu",
  "ssh_timeout": "30s",
  "shutdown_command": "echo 'packer' | sudo -S shutdown -P now"
}

build {
  name    = "k8s-failover-demo"
  sources = [
    "source.parallels.ubuntu"
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