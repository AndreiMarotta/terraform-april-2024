provider aws {
    region = "us-east-2"
}

resource "aws_key_pair" "deployer" {
  key_name   = "bastion"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "web" {
  ami           = "ami-08be1e3e6c338b037"
  instance_type = "t2.micro"
  #availability_zone = "us-east-2c"
  subnet_id = "subnet-0d12df832ce24a8c9"
  count = 3
  key_name = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id]

  tags = {
    Name = "HelloWorld"
  }
}

output ec2 {
  value       = aws_instance.web[0].public_ip
  #sensitive = false

}
