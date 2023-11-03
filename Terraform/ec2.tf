resource "aws_instance" "my_instance" {
  ami           = "ami-0e83be366243f524a"
  instance_type = "t2.micro"
  key_name = "Demo"
  security_groups = [aws_security_group.ec2_sg.id]
  subnet_id = "subnet-40407c0c"	
  tags = {
    Name = "My Instance"
  }
}

output "My_ip"{
  value =  aws_instance.my_instance.public_ip
}

resource "aws_security_group" "ec2_sg" {
  name        = "demo"
  description = "https"
  vpc_id      = "vpc-f1a4d39a"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress{
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
  tags = {
    Name = "demo"
  }
}

