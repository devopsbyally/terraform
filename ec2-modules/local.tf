# Locals to compute the naming convention
locals {
  naming_convention = "${var.env}-${var.application}"
}