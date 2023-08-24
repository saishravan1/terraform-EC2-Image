
#security group
resource "aws_security_group" "secruity_group_tf" {
  name        = "tf-security-group"
  description = "Allow TLS inbound traffic"

  ingress {
    description      = "SSH "
    from_port        = 0
    to_port          = 65
    protocol         = "tcp"
    cidr_blocks      = ["24.98.245.205/32"]
  }
  ingress {
    description      = "http"
    from_port        = 0
    to_port          = 8000
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description      = "https"
    from_port        = 0
    to_port          = 500
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    "name" = "tf_sg"
  }
}

# extract ami using data source 


data "aws_ami" "linux_ami" {
#   executable_users = ["amazon"]
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name = "architecture"
    values = [ "x86_64" ]
  }
}

#ec2 instances

resource "aws_instance" "test-instance" {
  ami           = data.aws_ami.linux_ami.id
  instance_type = var.aws_instance_type
  key_name      = var.aws_instance_key
  vpc_security_group_ids = [aws_security_group.secruity_group_tf.id]
  user_data = "${file("userdata.sh")}"
  tags = {
    "Name" = "saitest"
  }
}




