


terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region  = "eu-central-1"
  profile = "techstarter"
}


resource "aws_security_group" "sg" {
  name        = "ansible_instance_sg"
  description = "Allow SSH, HTTP inbound traffic"


  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "kp" {
  key_name   = "id_rsa"
  public_key = file("/home/mohanad/.ssh/id_rsa.pub")
                    
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
resource "aws_instance" "test" {
  ami             = "ami-0d318f1f104612755"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.sg.name]
  key_name        = aws_key_pair.kp.key_name

}

output "ec2_ip" {
  value = aws_instance.test.public_ip
}



















# terraform {
#   required_version = ">= 1.0"

#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~> 5.0"
#     }
#   }
# }

# provider "aws" {
#   region  = "eu-central-1"
#   profile = "techstarter"
# }

# resource "aws_vpc" "main" {
#   cidr_block = "10.0.0.0/16"  # Specify an appropriate CIDR block for your VPC
# }


# resource "aws_security_group" "sg" {
#   name        = "ansible_instance_sg"
#   description = "Allow SSH, HTTP inbound traffic"
#   vpc_id      = aws_vpc.main.id  # Associate with the created VPC

#   ingress {
#     description = "SSH from anywhere"
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     description = "HTTP anywhere"
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     description = "Allow all outbound traffic"
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }

# resource "aws_key_pair" "kp" {
#   key_name   = "ec2 key"
#   public_key = file("praxiskey.pub")
# }

# # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
# resource "aws_instance" "test" {
#   ami             = "ami-06dd92ecc74fdfb36"
#   instance_type   = "t2.micro"
#   security_groups = [aws_security_group.sg.name]
#   key_name        = aws_key_pair.kp.key_name
#   subnet_id       = aws_vpc.main.subnet_ids[0]
# }

# output "ec2_ip" {
#   value = aws_instance.test.public_ip
# }
