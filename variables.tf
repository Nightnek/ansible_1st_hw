###cloud vars
variable "cloud_id" {
  type        = string
  default = "b1gua5vm4htrvegtvhce"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default = "b1gpf79u52rvts6oo1mn"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "ansible"
  description = "VPC network&subnet name"
}

###common vars

variable "ssh_key" {
  type = map(object({
    serial-port-enable = string
    ssh-keys = string
  }))
  default = {
    metadata = {
      serial-port-enable = "1"
      ssh-keys = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOmq72t4OpWQw3bQC/bMZ4g+pexLbMxHRiZsUuQ+hZGb g-l-s@Nightnek_laptop"
    }
  }
}

variable "ssh_key_private" {
  default = "~\\.ssh\\id_ed25519"
  
}

variable "vm_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "Type of platform to use"
}

variable "vm_preemptible" {
  type        = bool
  default     = true
  description = "Could it be stopped or not"
}

variable "vm_os_family" {
  type        = string
  default     = "centos-7-oslogin"
  description = "A name of the OS"
}

variable "vm_name" {
  type        = string
  default     = "netology-develop-platform-ansible"
  description = "A name of the VM"
}
variable "vm_nat" {
  type        = bool
  default     = true
  description = "Should we have nat or not"
}
variable "vm_cpu_count" {
  type        = number
  default     = 2
  description = "count of cpus"
}

variable "vm_ram_count" {
  type        = number
  default     = 1
  description = "value of ram"
}

variable "vm_core_fraction" {
  type        = number
  default     = 20
  description = "core_fraction"
}


