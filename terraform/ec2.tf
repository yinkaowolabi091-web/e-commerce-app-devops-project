# -----------------------------
# Data source for Ubuntu 22.04 LTS AMI
# -----------------------------
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

# -----------------------------
# Key Pair
# -----------------------------
resource "aws_key_pair" "deployer" {
  key_name   = "terra-automate-key"
  public_key = file("terra-key.pub")
}

# -----------------------------
# Security Group allowing SSH, HTTP, HTTPS, Jenkins
# -----------------------------
resource "aws_security_group" "allow_user_to_connect" {
  name        = "allow_user_to_connect"
  description = "Allow SSH, HTTP, HTTPS, Jenkins"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Jenkins"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  tags = {
    Name = "jenkins-sg"
  }
}

# -----------------------------
# EC2 Instance
# -----------------------------
resource "aws_instance" "jenkins" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.allow_user_to_connect.id]
  subnet_id              = module.vpc.public_subnets[0]
  user_data              = file("${path.module}/install_tools.sh")

  tags = {
    Name = "Jenkins-Server"
  }

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
  }
}

# -----------------------------
# Elastic IP
# -----------------------------
resource "aws_eip" "jenkins_server_ip" {
  instance = aws_instance.jenkins.id
  domain   = "vpc"
}
