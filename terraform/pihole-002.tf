variable "pihole_002" {
    type = object({
        cloudinit_username  = string
        cloudinit_password  = string
        cloudinit_ipaddress = string
        cloudinit_cidr      = string
        cloudinit_gateway   = string
        cloudinit_dns1      = string
        cloudinit_dns2      = string
        vm_template         = string
        vm_id               = number
        vm_name             = string
        vm_description      = string
        vm_node             = string
        vm_qemu_agent       = number
        vm_cpu_cores        = string
        vm_cpu_sockets      = string
        vm_cpu_type         = string
        vm_vcpu             = string
        vm_memory           = string
        vm_net_model        = string
        vm_net_bridge       = string
        vm_net_vlan         = number
    })
}

resource "proxmox_vm_qemu" "pihole_002" {
    name = var.pihole_002.vm_name
    desc = var.pihole_002.vm_description

    # Node name has to be the same name as within the cluster
    # this might not include the FQDN
    target_node = var.pihole_002.vm_node
    vmid = var.pihole_002.vm_id

    # The template name to clone this vm from
    clone = var.pihole_002.vm_template
    bootdisk = "scsi0"
    # Activate QEMU agent for this VM
    agent = var.pihole_002.vm_qemu_agent

    cores = var.pihole_002.vm_cpu_cores
    sockets = var.pihole_002.vm_cpu_sockets
    vcpus = var.pihole_002.vm_vcpu
    cpu = var.pihole_002.vm_cpu_type
    memory = var.pihole_002.vm_memory

    # Setup the network interface and assign a vlan tag: 256
    network {
        id = 0
        model = var.pihole_002.vm_net_model
        bridge = var.pihole_002.vm_net_bridge
        tag = var.pihole_002.vm_net_vlan
    }

    # Setup the ip address using cloud-init.
    # Keep in mind to use the CIDR notation for the ip.
    os_type = "cloud-init"
    ciuser = var.pihole_002.cloudinit_username
    cipassword = var.pihole_002.cloudinit_password
    ipconfig0 = "ip=${var.pihole_002.cloudinit_ipaddress}/${var.pihole_002.cloudinit_cidr},gw=${var.pihole_002.cloudinit_gateway}"
    nameserver = "${var.pihole_002.cloudinit_dns1} ${var.pihole_002.cloudinit_dns2}"

    provisioner "remote-exec" {
        inline = [
            "git clone ${var.iac_scripts.git_repository} ${var.iac_scripts.tmp_directory}",
            "sudo sh ${var.iac_scripts.tmp_directory}/linux/os/distro/debian-based/generic/apt/check-apt-inprogress.sh",
            "sudo cp -r ${var.iac_scripts.tmp_directory}/linux/software/pihole/templates/etc/pihole /etc/.",
            "sudo sh ${var.iac_scripts.tmp_directory}/linux/software/pihole/configure.sh ${var.pihole_002.cloudinit_ipaddress} ${var.pihole_002.cloudinit_dns1} ${var.pihole_002.cloudinit_dns2}",
            "sudo sh ${var.iac_scripts.tmp_directory}/linux/software/pihole/install.sh",
            "sudo sh ${var.iac_scripts.tmp_directory}/linux/software/pihole/secure_admin.sh '${var.pihole.webpassword}'",
            "sudo sh ${var.iac_scripts.tmp_directory}/linux/software/pihole/database/install_mmotti_regex.sh",
            "sudo sh ${var.iac_scripts.tmp_directory}/linux/software/pihole/database/install_firebog.sh"
        ]
        
        connection {
            type = "ssh"
            user = var.pihole_002.cloudinit_username
            password = var.pihole_002.cloudinit_password
            host = var.pihole_002.cloudinit_ipaddress
        }
    }
}