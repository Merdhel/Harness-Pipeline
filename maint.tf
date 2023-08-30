provider "aws" {
  region = "ap-southeast-1"
}

 

resource "aws_vpc" "VPCmine" {
  cidr_block = "10.0.0.0/24"
}

 

resource "aws_subnet" "subnet-0f46fd8f011c05a34" {
  vpc_id            = aws_vpc.VPCmine.id
  cidr_block        = "10.0.0.128/26"
  availability_zone = "ap-southeast-1a"
}

 

resource "aws_security_group" "TestSG" {
  name        = "TestSG"
  description = "Test security group"
  vpc_id      = aws_vpc.VPCmine.id
}

 

resource "aws_instance" "example_instance" {
  ami           = "ami-062508d30d9f2cb68"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.subnet-0f46fd8f011c05a34.id
  key_name      = "server"
  vpc_security_group_ids = [aws_security_group.TestSG.id]
}