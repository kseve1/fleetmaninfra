/*provider "aws" {
  region = "eu-central-1"
}*/

data "aws_ami" "Blue-team" {
  most_recent = true

  filter {
    name   = "name"
    values = ["blue-teams-jenkins-image*"]
  }

  /*tags = {
    Name  = "Blue Team"
    owner = var.owner
  }*/

  owners = [var.aws_account_owner]
}

resource "aws_key_pair" "dsw-key" {
  key_name   = "dsw-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDCrXmHHrI+9PR4m7/8imIRrwQWF6md+1oaCRZM/r8jpfhLqqsN8pIUztl+Lu6PxGp9KdJFIlKxUhcMn1pINXYdETq6Tp0lIUjxXLrA9eUkdjt6TU7UG3vR1ibR4Nx2SGwULntsrUNDoYQX8l1AGgM4jLLQoba45xIFfVRlUkvcHaReifHsDQHnYsHBSZ0tg0GI9KUnPBgyoNa9/eBgPLH3NbQdg98lKdjqSdRNITT2qGe6GyS1On2OWJiOYqNwhQQY8zwAaPhDpcthKH+Vp7+sB3odL3CQzAhZnOie4+6xsV/uIPkljYrrJDGfqGonekUpuWR9lSjPTe9ZxY6N4bVz eric.echter@EricEchters-MacBook-Pro.local"
}

resource "aws_instance" "webserver" {
  ami           = "${data.aws_ami.red-ami.id}"
  instance_type = "t2.micro"
  /*iam_instance_profile = var.iam_role*/
  key_name = "dsw-key"
  security_groups = [
    var.my_security_group
  ]
  tags = {
    Name  = "Blue Team Jenkins Server"
    owner = var.owner
  }
}
