

provider "aws" {

  region = "ap-southeast-1"

}



resource "aws_vpc" "VPCmine" {

  cidr_block = "10.0.0.0/24"

}



resource "aws_subnet" "public_subnet1" {

  vpc_id = aws_vpc.VPCmine.id

  cidr_block = "10.0.0.0/26"

  availability_zone = "ap-southeast-1a"

  map_public_ip_on_launch = true

}



resource "aws_subnet" "public_subnet2" {

  vpc_id = aws_vpc.VPCmine.id

  cidr_block = "10.0.0.64/26"

  availability_zone = "ap-southeast-1b"

  map_public_ip_on_launch = true

}



resource "aws_subnet" "private_subnet1" {

  vpc_id = aws_vpc.VPCmine.id

  cidr_block = "10.0.0.128/26"

  availability_zone = "ap-southeast-1a"

  map_public_ip_on_launch = false

}



resource "aws_subnet" "private_subnet2" {

  vpc_id = aws_vpc.VPCmine.id

  cidr_block = "10.0.0.192/26"

  availability_zone = "ap-southeast-1b"

  map_public_ip_on_launch = false

}
resource "aws_instance" "windows" { 
    ami = "ami-062508d30d9f2cb68"
     instance_type = "t2.micro" 
     
    
    tags = { 
    name = "demo-instance"
     }
  }