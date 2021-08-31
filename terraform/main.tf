provider "aws" {
  region = "us-east-2"
}
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

resource "aws_instance" "test1" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name = "mk-rsa"
  root_block_device {
	volume_size = 10
  }
  
  ebs_block_device {
    device_name = "/dev/sdf"
    volume_size = 5
    volume_type = "gp2"
    delete_on_termination = true
  }
  
  disable_api_termination = true

  tags = {
    Name = "TestInstance1"
    Project = "Netology"
  }
}
