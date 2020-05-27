variable "name" {
  description = "ECR repository name"
  default = "nginx"
}

variable "scan_on_push" {
  description = "Automatically scan pushed images for vulnerabilities"
  default     = true
}

variable "untagged_image_expiry_days" {
  description = "Age (in days) of untagged images to be removed automatically"
  type        = number
  default     = 7
}

variable "import_frequency" {
  description = "Indicates how often to check the source registry for updates (once, weekly, daily, hourly, always)"
  default     = "weekly"
}

variable "source_tags" {
  description = "A list of tags for image import from external registry"
  type        = list(string)
  default     = ["latest"]
}
