provider "proxmox" {
    pm_api_url      = var.proxmox_connection.url
    pm_user         = var.proxmox_connection.username
    pm_password     = var.proxmox_connection.password
    pm_tls_insecure = var.proxmox_connection.insecure
}

variable "proxmox_connection" {
    type = object({
        url       = string
        username  = string
        password  = string
        insecure  = bool
    })
}