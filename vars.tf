variable "name" {
  description = "ECR repository name"
}

variable "untagged_image_expiry_days" {
  description = "Age (in days) of untagged images to be removed automatically"
  type        = number
  default     = 14
}
