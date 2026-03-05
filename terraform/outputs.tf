output "region" {
  description = "The AWS region where resources are created"
  value       = local.region
}

output "vpc_id" {
  description = "The ID of the created VPC"
  value       = module.vpc.vpc_id
}

output "eks_cluster_name" {
  description = "EKS cluster name"
  value       = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
  description = "EKS cluster API endpoint"
  value       = module.eks.cluster_endpoint
}

output "jenkins_public_ip" {
  description = "Public IP of the Jenkins EC2 instance"
  value       = aws_eip.jenkins_server_ip.public_ip
}

# Optional: if you still want EKS node group public IPs, ensure the data source exists
# output "eks_node_group_public_ips" {
#   description = "Public IPs of the EKS node group instances"
#   value       = data.aws_instances.eks_nodes.public_ips
# }
