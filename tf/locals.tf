locals {
  resource_prefix           = "${var.service}-${var.envname}"
  resource_prefix_no_hyphen = "${var.service}${var.envname}"

  standard_tags = {
    Environment  = var.envname
    Application  = var.service
    Creator = "${local.resource_prefix}-terraform"
  }


}