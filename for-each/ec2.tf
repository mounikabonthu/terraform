resource "aws_instance" "this" {
  for_each = var.instances # terraform will give us a variable called each
  ami                    = "ami-09c813fb71547fc4f"
  instance_type          = each.value
  vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]

  tags = {
    Name    = each.key
    Purpose = "terraform-practice"
  }
}

resource "aws_security_group" "allow_ssh_terraform" {
  name        = "allow_ssh"
  description = "Allow port no 22 for SSH access"

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}

output "ec2_info" {
  value = aws_instance.this
}
