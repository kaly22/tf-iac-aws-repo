provider "aws" {
    region = var.aws_region
}

#Create security group with firewall rules
resource "aws_security_group" "my_security_group" {
    name        = var.security_group
    description = "security group for EC2 instance"
    vpc_id      = vpc-031c730818d73cc99

    ingress {
        from_port   = 8080
        to_port     = 8080
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    # outbound from jenkins server
    egress {
        from_port   = 0
        to_port     = 65535
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags= {
        Name = var.security_group
    }
}

# Create EC2 instance
resource "aws_instance" "kalFirstInstance" {
    ami         = var.ami_id
    key_name    = var.key_name
    instance_type = var.instance_type
    security_group = [var.security_group]
    tags= {
        Name = var.tag_name
    }
}

# Create Elastic IP address
resource "aws_eip" "kalFirstInstance" {
    vpc     = true
    instance = aws_instance.kalFirstInstance.id
tags= {
    Name = "my_elastic_ip"
}
}