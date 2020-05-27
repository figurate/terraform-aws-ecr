/**
 * Synchronise image from external Docker registry.
 */
resource "null_resource" "source_ecr_login" {
  count = length(var.source_registry) > 0 ? 1 : 0
  triggers = {
    always_run = timestamp()
  }
  provisioner "local-exec" {
    command = "$(aws ecr get-login --registry-ids ${split(".", var.source_registry)[0]} --no-include-email)"
  }
}

resource "null_resource" "source_pull" {
  count = length(var.source_tags)
  triggers = {
    always_run = timestamp()
  }
  provisioner "local-exec" {
    command = "docker pull ${local.import_registry}${var.name}:${var.source_tags[count.index]}"
  }
  depends_on = [null_resource.source_ecr_login]
}

resource "null_resource" "ecr_login" {
  triggers = {
    always_run = timestamp()
  }
  provisioner "local-exec" {
    command = "$(aws ecr get-login --no-include-email)"
  }
  depends_on = [null_resource.source_pull]
}

resource "null_resource" "ecr_push" {
  count = length(var.source_tags)
  triggers = {
    import = local.import_triggers[var.import_frequency]
  }
  provisioner "local-exec" {
    command = <<EOF
docker tag ${local.import_registry}${var.name}:${var.source_tags[count.index]} ${aws_ecr_repository.repository.repository_url}:${var.source_tags[count.index]} \
 && docker push ${aws_ecr_repository.repository.repository_url}:${var.source_tags[count.index]}
EOF
  }
  depends_on = [null_resource.ecr_login]
}

locals {
  import_triggers = {
    once   = "once"
    weekly = tonumber(formatdate("", timestamp())) / 4
    daily  = formatdate("DD", timestamp())
    hourly = formatdate("hhZ", timestamp())
    always = timestamp()
  }

  // ensure trailing slash where source registry is specified..
  import_registry = length(var.source_registry) > 0 ? join("", [split("/", var.source_registry)[0], "/"]) : ""
}