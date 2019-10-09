provider "aws" {
  region = "eu-central-1"
}

data "aws_ami" "blue-ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["blue-team*"]
  }

  owners = [var.aws_account_owner]
}

resource "aws_key_pair" "dsw-key" {
  key_name   = "dsw-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDW9/BFHYbRhk/Bub+QUWdRYhK9RQ14kDBqdMAgzWCYk/VcNiqfnKbpKa6AFOAEGHv9VDnb1cHyCZSexHE7YeVmvkxQVgVLvz9TP/9MFrapXrEHAOsKmMsZUDVAeaPAitiS+DY4ngPxJamoGWTohlaOcuqdePjJ7F1K7udy7y8BULABgBaaClBYgDi83z9ErPePnlYLq3ns7c/g180AhW9ereGFdAplZY9aAQtu1CeT2JLDJT8VHHYsnO4p2fcenM/VtfcDtddlmdPUYAJBEqz5XYysxExlDz3Kv3vOGCSvzByVF3jN5ux+19sT4h/udgvXO9Igp1FaRE1weV+uOdXv david.wilkinson@DavidWilkinsons-MacBook-Pro.local"
}

resource "aws_instance" "webserver" {
  ami           = "${data.aws_ami.blue-ami.id}"
  instance_type = "t3.medium"
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
