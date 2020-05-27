# ![AWS](aws-logo.png) ECR Repository

Purpose: Defaults for ECR repositories.

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
| untagged\_image\_expiry\_days | Age (in days) of untagged images to be removed automatically | `number` | `14` | no |

## Outputs

No output.

