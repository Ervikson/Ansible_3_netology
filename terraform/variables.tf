variable "zone" {
  description = "Yandex Cloud zone"
  type        = string
  default     = "ru-central1-a"
}

variable "ssh_public_key" {
  description = "Path to SSH public key"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "cloud_id" {
  description = "Yandex Cloud ID"
  type        = string
}

variable "folder_id" {
  description = "Folder ID that hosts the resources"
  type        = string
}

variable "network_name" {
  type        = string
  default     = "ansible-vpc"
}

variable "subnet_name" {
  type        = string
  default     = "ansible-subnet"
}

variable "cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "platform_id" {
  type        = string
  default     = "standard-v1"
}

variable "username" {
  type        = string
  default     = "ubuntu"
}

variable "clickhouse" {
  type        = string
  default     = "clickhouse"
}

variable "lighthouse" {
  type        = string
  default     = "lighthouse"
}

variable "vector" {
  type        = string
  default     = "vector"
}

variable "vm_resources" {
  description = "Resources for VMs"
  type = object({
    cores         = number
    memory        = number
    core_fraction = number
  })
  default = {
    cores         = 2
    memory        = 4
    core_fraction = 20
  }
}

variable "vm_image_id" {
  description = "ID of the base image"
  type        = string
  default     = "fd84l3kpm41j1pcogc3g"
}

variable "vm_boot_disk_size" {
  description = "Boot disk size for VMs (GB)"
  type        = number
  default     = 20
}