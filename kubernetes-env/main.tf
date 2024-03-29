
resource "proxmox_vm_qemu" "master" {
  name        = "master01"
  target_node = "pve"
  clone       = "ubuntu-20.04.01"
  desc        = "Master Node"
  #onboot = true
  full_clone = true
  agent      = 1
  cores      = 2
  sockets    = 1
  cpu        = "host"
  memory     = 2048
  scsihw     = "virtio-scsi-pci"
  os_type    = "ubuntu"
  #qemu_os    = "126"

  network {
    bridge = "vmbr6"
    model  = "virtio"
  }
  disks {
    scsi {
      scsi0 {
        disk {
          storage = "disk_images"
          # size cannot be less than the image template (25G)
          size = 25
        }
      }
    }
  }

  #pool = "offense"

  connection {
    type     = "ssh"
    user     = "adam"
    password = var.ssh_pass
    host     = self.default_ipv4_address
  }

  # setup network custom information
  provisioner "file" {
    source = "./01-netplan.yaml"
    destination = "/tmp/00-netplan.yaml"
  }

  provisioner "remote-exec" {
    inline = [
      "echo adam | sudo -S mv /tmp/00-netplan.yaml /etc/netplan/00-netplan.yaml",
      "sudo hostnamectl set-hostname master01",
      "sudo netplan apply && sudo ip addr add dev ens18 ${self.default_ipv4_address}",
      "ip a s"
     ] 
  }
}

resource "proxmox_vm_qemu" "worker01" {
  name        = "worker01"
  target_node = "pve"
  clone       = "ubuntu-20.04.01"
  desc        = "Worker Node 1"
  #onboot = true
  full_clone = true
  agent      = 1
  cores      = 2
  sockets    = 1
  cpu        = "host"
  memory     = 2048
  scsihw     = "virtio-scsi-pci"
  os_type    = "ubuntu"
  #qemu_os    = "126"

  network {
    bridge = "vmbr6"
    model  = "virtio"
  }
  disks {
    scsi {
      scsi0 {
        disk {
          storage = "disk_images"
          # size cannot be less than the image template (25G)
          size = 25
        }
      }
    }
  }

  #pool = "offense"

  connection {
    type     = "ssh"
    user     = "adam"
    password = var.ssh_pass
    host     = self.default_ipv4_address
  }

  # setup network custom information
  provisioner "file" {
    source = "./02-netplan.yaml"
    destination = "/tmp/00-netplan.yaml"
  }

  provisioner "remote-exec" {
    inline = [
      "echo adam | sudo -S mv /tmp/00-netplan.yaml /etc/netplan/00-netplan.yaml",
      "sudo hostnamectl set-hostname worker01",
      "sudo netplan apply && sudo ip addr add dev ens18 ${self.default_ipv4_address}",
      "ip a s"
     ] 
  }

}

resource "proxmox_vm_qemu" "worker02" {
  name        = "worker02"
  target_node = "pve"
  clone       = "ubuntu-20.04.01"
  desc        = "Worker Node 2"
  #onboot = true
  full_clone = true
  agent      = 1
  cores      = 2
  sockets    = 1
  cpu        = "host"
  memory     = 2048
  scsihw     = "virtio-scsi-pci"
  os_type    = "ubuntu"
  #qemu_os    = "126"

  network {
    bridge = "vmbr6"
    model  = "virtio"
  }
  disks {
    scsi {
      scsi0 {
        disk {
          storage = "disk_images"
          # size cannot be less than the image template (25G)
          size = 25
        }
      }
    }
  }

  #pool = "offense"

  connection {
    type     = "ssh"
    user     = "adam"
    password = var.ssh_pass
    host     = self.default_ipv4_address
  }

  # setup network custom information
  provisioner "file" {
    source = "./03-netplan.yaml"
    destination = "/tmp/00-netplan.yaml"
  }

  provisioner "remote-exec" {
    inline = [
      "echo adam | sudo -S mv /tmp/00-netplan.yaml /etc/netplan/00-netplan.yaml",
      "sudo hostnamectl set-hostname worker02",
      "sudo netplan apply && sudo ip addr add dev ens18 ${self.default_ipv4_address}",
      "ip a s"
     ] 
  }
}