module "vpc" {
  source      = "./modules/vpc"
  environment = terraform.workspace
}

module "eks" {
  source      = "./modules/eks"
  environment = terraform.workspace
}

