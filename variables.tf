variable "aws_region" {
    description = "The AWS region to create things in."
    default     = "us-east-2"
}

variable "key_name" {
        description = "SSH keys to connect to ec2 instance"
        default     = "Ohio-KeyPair"
}

variable "instance_type" {
    description = "instance type for ec2"
    default     = "t2.micro"
}

variable "security_group" {
    description = "Name of security group"
    default     = "Jenkins-SG"
}

variable "tag_name" {
    description = "Tag name for EC2 instance"
    default     = "kal-ec2-instance"
}

variable "ami_id" {
    description = " AMI for Ubuntu EC2 instance"
    default     = "ami-097a2df4ac947655f"
}