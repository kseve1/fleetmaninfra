provider "aws" {
  region = "eu-central-1"
}

resource "aws_security_group" "red-sg-2" {
  //name = "blue-ericechter-instance-${random_id.myrandom.hex}"
  name = "red-sg-2"
  tags = {
    Name  = "Red Team SG"
    owner = var.owner
  }
  ingress {
    from_port   = var.from_port
    to_port     = var.to_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

/*resource "random_id" "myrandom" {
  byte_length = 3
}*/
