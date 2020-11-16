module "repository" {
  source = "../.."

  name                       = "nginx"
  scan_on_push               = var.scan_on_push
  untagged_image_expiry_days = var.untagged_image_expiry_days
}

module "import" {
  count  = var.import_enabled ? length(var.source_tags) : 0
  source = "figurate/docker-container/docker//modules/ecr"

  name       = "nginx_push_${var.source_tags[count.index]}"
  command    = ["push", "nginx", var.source_tags[count.index], var.source_tags[count.index]]
  depends_on = [module.repository]
  rm         = false
  aws_region = var.aws_region
}
