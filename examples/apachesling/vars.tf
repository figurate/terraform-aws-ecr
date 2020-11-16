variable "scan_on_push" {
  description = "Automatically scan pushed images for vulnerabilities"
  default     = true
}

variable "untagged_image_expiry_days" {
  description = "Age (in days) of untagged images to be removed automatically"
  type        = number
  default     = 7
}

variable "source_tags" {
  description = "A list of tags for image import from external registry"
  type        = list(string)
  default     = ["latest"]
}

variable "aws_region" {
  description = "AWS region for running ECR commands"
  default     = "ap-southeast-2"
}
