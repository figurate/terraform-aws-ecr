variable "name" {
  description = "ECR repository name"
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
