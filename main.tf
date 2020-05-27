/**
 * # ![AWS](aws-logo.png) ECR Repository
 *
 * Purpose: Defaults for ECR repositories.
 */
resource "aws_ecr_repository" "repository" {
  name = var.name

  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }
}

resource "aws_ecr_lifecycle_policy" "untagged_images" {
  repository = aws_ecr_repository.repository.name
  policy     = <<EOF
{
  "rules": [
    {
      "rulePriority: 1,
      "description": "Remove untagged images older than ${var.untagged_image_expiry_days} days",
      "selection": {
        "tagStatus": "untagged",
        "countType": "sinceImagePushed",
        "countUnit": "days",
        "countNumber: ${var.untagged_image_expiry_days}
      },
      "action": {
        "type": "expire"
      }
    }
  ]
}
EOF
}