variable "environment_name" {
  default = "sbx"
}

variable "purpose" {
  default = "tfvm"
}

variable "resource_group_prefix" {
  default = "rg"
}
variable "storage_account_prefix" {
  default = "sta"
}
variable "instance_id" {
  default = "1"
}

variable "cloud_service_provider" {
  default = "az"
}

variable "operating_system" {
  default = "lin"
}

#Variables from ubuntu first boot repo
variable "user" {
  type        = string
  description = "New username"
  default = "arnitibrahimi"
}

variable "ssh_public_key_file" {
  type        = string
  description = "public SSH key for the user"
  default = abspath("${path.module}/pub_id_rsa")
}

variable "default_python" {
  type        = string
  description = "Default Python version for the VM"
  default     = "3.10"
}

# variable "custom_data" {
#   description = "custom VM setup commands"
#   type        = string
# }