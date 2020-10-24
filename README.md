# ![AWS](aws-logo.png) ECR Repository

![AWS ECR Repository](aws\_ecr\_repository.png)

Purpose: Defaults for ECR repositories.

Requirements: To execute the image import the execution environment must have the following installed:
* Docker
* AWS CLI

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | ECR repository name | `any` | n/a | yes |
| scan\_on\_push | Automatically scan pushed images for vulnerabilities | `bool` | `true` | no |
| untagged\_image\_expiry\_days | Age (in days) of untagged images to be removed automatically | `number` | `7` | no |

## Outputs

| Name | Description |
|------|-------------|
| repository\_url | n/a |

