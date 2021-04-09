resource "aws_instance" "bastian" {
  ami = "ami-08962a4068733a2b6"
  instance_type = "t2.micro"

  subnet_id = module.iti.public1_id
  vpc_security_group_ids = [aws_security_group.bastian-sc.id]
  key_name = "networkdesign"
  tags = {
    Name = "bastian"
  }
}