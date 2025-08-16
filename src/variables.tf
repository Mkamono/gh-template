variable "owner" {
  type    = string
  default = "Mkamono"
}

variable "repository" {
  type = string
}

variable "visibility" {
  type = string

  validation {
    condition     = contains(["public", "private", "internal"], var.visibility)
    error_message = "Visibility must be one of: public, private, or internal."
  }
}
