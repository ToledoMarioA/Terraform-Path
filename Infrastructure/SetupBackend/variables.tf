variable "name_group" {
  description = "Nombre del grupo de recursos"
  type        = string
  default     = "Resources_OXXO_IaC_"
}

variable "location" {
  description = "Ubicación del grupo de recursos y la cuenta de almacenamiento"
  type        = string
  validation {
    condition     = contains(["East US", "East US 2", "Central US"], var.location)
    error_message = "La ubicación debe ser 'East US', 'East US 2' o 'Central US'."
  }
}

variable "storage_account_name" {
  description = "Nombre de la cuenta de almacenamiento"
  type        = string
}

variable "container_name" {
  description = "Nombre del contenedor en la cuenta de almacenamiento"
  type        = string
}
