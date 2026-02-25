provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "web_sg_p4" {
  name        = "webserver-sg-p4"
  description = "Permitir SSH e HTTP"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "web_server_p4" {
  ami           = "ami-04b4f1a9cf54c11d0" # Ubuntu 24.04
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.web_sg_p4.id]

  # O SCRIPT MÁGICO VEM AQUI:
  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update -y
              sudo apt-get install -y apache2
              sudo systemctl start apache2
              sudo systemctl enable apache2
              echo "<h1>Servidor do Rodrigo no ar via Terraform!</h1>" > /var/www/html/index.html
              EOF

  tags = {
    Name = "Webserver-Projeto-4"
  }
}

# MOSTRA O IP NO FINAL
output "ip_do_servidor" {
  value = aws_instance.web_server_p4.public_ip
}
