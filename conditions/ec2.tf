resource "aws_instance" "terraform-demo" {
  ami                    = var.ami_id
  instance_type          = var.environment== "prod" ? "t3.small" :"t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]

  tags = var.ec2_tags
}

resource "aws_security_group" "allow_ssh_terraform" {
  name        = "allow_ssh"
  description = "Allow port no 22 for SSH access"

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  ingress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = "tcp"
    cidr_blocks      = var.cidr_blocks
   
  }

  tags = var.sg_tags
}

