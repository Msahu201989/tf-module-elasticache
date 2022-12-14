resource "aws_security_group" "sg" {
  name        = "${var.env}-${var.name}-elasticache.sg"
  description = "${var.env}-${var.name}-elasticache.sg"
  vpc_id      = var.vpc_id

  ingress {
    description = "REDIS"
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${var.env}-${var.name}-elasticache.sg"
  }
}