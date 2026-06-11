variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
  default     = "malak-mayar-proj2-aci-rg"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "swedencentral"
}

variable "container_group_name" {
  description = "Name of the Azure Container Instance"
  type        = string
  default     = "malak-mayar-proj2-aci"
}

variable "dns_name_label" {
  description = "DNS label for the Azure Container Instance"
  type        = string
  default     = "malak-mayar-proj2-cloudscale"
}

variable "docker_image" {
  description = "Docker Hub image name"
  type        = string
  default     = "mayar4784/cloudscale-project2:latest"
}

variable "student_name" {
  description = "Student name used in Azure tags"
  type        = string
  default     = "Mayar and Malak"
}