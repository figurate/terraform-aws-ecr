variable "source_tags" {
  description = "A list of tags for image import from external registry"
  type        = list(string)
  default     = ["latest"]
}

variable "aws_region" {
  description = "AWS region for running ECR commands"
  default     = "ap-southeast-2"
}

variable "import_enabled" {
  description = "Flag to enable push to ECR"
  default = false
}
