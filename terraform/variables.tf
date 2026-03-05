# FIXED: Removed unused aws_region and ami_id variables
# (they conflicted with local.region defined in provider.tf)

variable "instance_type" {
  description = "Instance type for EC2 instances (Jenkins + Bastion)"
  default     = "t3.medium"
}

variable "my_environment" {
  description = "Deployment environment tag"
  default     = "dev"
}
