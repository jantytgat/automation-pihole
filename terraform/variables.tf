variable "iac_scripts" {
    type = object({
        git_repository      = string
        tmp_directory       = string
    })
}

variable "pihole" {
    type = object({
        webpassword         = string
    })
}
