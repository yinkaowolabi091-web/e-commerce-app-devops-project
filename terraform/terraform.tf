# =============================================================
# PRE-REQUISITES - run these ONCE before terraform init:
#
# aws s3api create-bucket \
#   --bucket ykay-ecommerce-project-new-2 \
#   --region eu-west-1 \
#   --create-bucket-configuration LocationConstraint=eu-west-1
#
# aws s3api put-bucket-versioning \
#   --bucket ykay-ecommerce-project-new-2 \
#   --versioning-configuration Status=Enabled
#
# aws s3api put-public-access-block \
#   --bucket ykay-ecommerce-project-new-2 \
#   --public-access-block-configuration \
#     "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true"
#
# aws dynamodb create-table \
#   --table-name terraform-locks \
#   --attribute-definitions AttributeName=LockID,AttributeType=S \
#   --key-schema AttributeName=LockID,KeyType=HASH \
#   --billing-mode PAY_PER_REQUEST \
#   --region eu-west-1
# =============================================================

terraform {
  required_version = ">= 1.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "ykay-ecommerce-project-new-2"
    key            = "terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
