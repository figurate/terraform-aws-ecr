# ![AWS](aws-logo.png) ECR Repository

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
| null | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| import\_frequency | Indicates how often to check the source registry for updates (`once`, `weekly`, `daily`, `hourly`, `always`, `never`) | `string` | `"never"` | no |
| name | ECR repository name | `any` | n/a | yes |
| scan\_on\_push | Automatically scan pushed images for vulnerabilities | `bool` | `true` | no |
| source\_registry | The source registry for importing images (note this should include the trailing forward slash (e.g. `registry1.docker.io/`)) | `string` | `""` | no |
| source\_tags | A list of tags for image import from external registry | `list(string)` | <pre>[<br>  "latest"<br>]</pre> | no |
| untagged\_image\_expiry\_days | Age (in days) of untagged images to be removed automatically | `number` | `7` | no |

## Outputs

No output.

