provider "aws" {
  region = "us-east-1"
}

# Création de deux instances EC2 pour le frontend
resource "aws_instance" "frontend" {
  count = 2
  ami           = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2
  instance_type = "t2.micro"
  tags = {
    Name = "frontend-server-${count.index + 1}"
  }
}

# Configuration du Load Balancer pour le frontend
resource "aws_elb" "frontend_load_balancer" {
  name               = "frontend-lb"
  availability_zones = ["us-east-1a", "us-east-1b"]

  listener {
    instance_port     = 3000
    instance_protocol = "HTTP"
    lb_port           = 80
    lb_protocol       = "HTTP"
  }

  health_check {
    target              = "HTTP:3000/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  instances = aws_instance.frontend[*].id

  tags = {
    Name = "frontend-lb"
  }
}
