variable "linode_token" {
  description = "Token for the linode provider"
  type        = string
  default     = ""
}

variable "ssh_public_key_path" {
  description = "Path to the SSH public key for Linode instance access"
  type        = string
}

variable "ssh_private_key_path" {
  description = "Path to the SSH private key for connecting to Linode instance"
  type        = string
}

variable "region" {
  description = "Linode region to deploy the instance"
  type        = string
  default     = "us-east"
}

variable "instance_type" {
  description = "Linode instance type"
  type        = string
  default     = "g6-nanode-1"
}

variable "root_password" {
  description = "Root password for the Linode instance"
  type        = string
  sensitive   = true
}

variable "postgres_password" {
  description = "Password for the Postgres user"
  type        = string
  sensitive   = true
}
