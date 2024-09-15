provider "aws" {
    region = "ap-south-1"
    access_key = "AKIA54WIGM26P4LXSJAE"
    secret_key = "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"
}

# resource "aws_vpc" "prd-vpc" {
#     cidr_block = "10.0.0.0/16"
#     tags = {
#         Name = "vpc-main-prd"
#     }
# }

# resource "aws_subnet" "sub-1" {
#   vpc_id = aws_vpc.prd-vpc.id
#   cidr_block = "10.0.1.0/24"
#   availability_zone = "ap-south-1a"
#   map_public_ip_on_launch = "true"

#   tags = {
#     Name = "prd_pub_sub-1a"
#   }
# }

# resource "aws_internet_gateway" "myigw" {
#     vpc_id = aws_vpc.prd-vpc.id

#     tags = {
#       Name = "myigw"
#     }
# }

# resource "aws_route_table" "pub-route" {
#     vpc_id = aws_vpc.prd-vpc.id

#     route  {
#         cidr_block = "0.0.0.0/0"
#         gateway_id = aws_internet_gateway.myigw.id
#     }

#     tags = {
#       Name = "my-pubroute"
#     }
# }

# resource "aws_route_table_association" "route-association" {
#     subnet_id = aws_subnet.sub-1.id
#     route_table_id = aws_route_table.pub-route.id
# }

# resource "aws_security_group" "sg" {
#     name = "web-sg"
#     description = "allow web traffic"
#     vpc_id = aws_vpc.prd-vpc.id

# }

# resource "aws_vpc_security_group_ingress_rule" "allowall" {
#   security_group_id = aws_security_group.sg.id
#   cidr_ipv4         = "0.0.0.0/0"
#   ip_protocol       = "-1"
# }

# resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
#   security_group_id = aws_security_group.sg.id
#   cidr_ipv4         = "0.0.0.0/0"
#   ip_protocol       = "-1" # semantically equivalent to all ports
# }

# resource "aws_network_interface" "interface" {
#     subnet_id = aws_subnet.sub-1.id
#     private_ips = ["10.0.1.15"]
#     security_groups = [aws_security_group.sg.id]

# }

# resource "aws_instance" "ubuntu" {
#     ami = "ami-0522ab6e1ddcc7055"
#     instance_type = "t2.micro"
    

#     network_interface {
#       network_interface_id = aws_network_interface.interface.id
#       device_index = 0
#     }

#     tags = {
#       Name = "Web-Server"
#     }
#     user_data = file("./server.sh")
  
# }