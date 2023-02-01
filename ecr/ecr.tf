module "ecr" {
  source           = "./modules/ecr"
  ecr_name         = var.ecr_name
  tags             = var.tags
  image_tag_mutability = var.image_tag_mutability
}