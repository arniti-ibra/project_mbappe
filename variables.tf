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
  default = "MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAoLhrtL69l8+RqFSxOr9Xl/t4uIP1uSIFyfHQ3RfBkNs/45m9vknNVKPGQ0c2PItTutzE7x78HQ5a2plsTIhYfLTEHxCYMY80vVuS/L/ju5DqVMf1EuZEY3pWHOzr1NYqyFP/N785OkYH3eF8ZU7Uuh4502Apz9wrPlvi1/HtbwLUzIVcslEim9MsiyesR//R9MdvUTubMIL/c/twPv31Wm4ZNnSp/XMC/RSfnk2SMFyVkbUXQNu0XMv6KChRwQwsNuhnBFMKRPtoT/Tizp4GbD6EOi1GnKHOP0M7hb5LQpZbXCNHklWJVEfDhY8DpEO40vM8rnSuHG/Ct6C9FulCM1X4+j10cEV+QXm259LFaMWX22GreKJj0Vl1SMlFwrbJtVcjW048mceGAEJWepRYvlZkl+fBekJz3GDhNdNwcZUc2rdzoWS/rus46e0OXD3W+MCJln1ymXaWGdrZOuDN83uOre2p0zj84O9Ld3fKgg+WVkGqC5XY8JlqYBIw/QSin0y5o1W3hPF4BfEBiCwqRUQPZrBpw968sif32hcXC1K1VuQ3f48y86zEtKq1RZDptUrfGxx4ZAwMgdP2LnXaZTsLfEfWOaylubiB4aF3OLL7ZwxJGAAb3GY/1ILlUAev1eiU3JpTCeMPXzu+JQ0Cpnn45Xzt+H3oUl4ijFqCDdECAwEAAQ=="
}

variable "default_python" {
  type        = string
  description = "Default Python version for the VM"
  default     = "3.10"
}