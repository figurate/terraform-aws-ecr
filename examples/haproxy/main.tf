module "repository" {
  source = "../.."

  name = "haproxy"
}

module "import" {
  count  = length(var.source_tags)
  source = "figurate/docker-container/docker//modules/ecr"

  name       = "nginx_push_${var.source_tags[count.index]}"
  command    = ["push", "haproxy", var.source_tags[count.index], var.source_tags[count.index]]
  depends_on = [module.repository]
  rm         = false
  aws_region = var.aws_region
}
