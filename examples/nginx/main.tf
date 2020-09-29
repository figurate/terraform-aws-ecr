module "repository" {
  source = "../.."

  name                       = "nginx"
  scan_on_push               = var.scan_on_push
  untagged_image_expiry_days = var.untagged_image_expiry_days
  import_frequency           = var.import_frequency
  source_tags                = var.source_tags
}
