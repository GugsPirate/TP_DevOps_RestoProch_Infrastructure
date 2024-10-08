provider "aws" {
  region = "us-east-1"
}

# Création de deux instances EC2 pour le backend
resource "aws_instance" "backend" {
  count = 2
  ami           = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2
  instance_type = "t2.micro"
  tags = {
    Name = "backend-server-${count.index + 1}"
  }
}

# Configuration du Load Balancer pour le backend
resource "aws_elb" "backend_load_balancer" {
  name               = "backend-lb"
  availability_zones = ["us-east-1a", "us-east-1b"]

  listener {
    instance_port     = 8080
    instance_protocol = "HTTP"
    lb_port           = 80
    lb_protocol       = "HTTP"
  }

  health_check {
    target              = "HTTP:8080/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  instances = aws_instance.backend[*].id

  tags = {
    Name = "backend-lb"
  }
}
