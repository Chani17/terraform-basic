resource "aws_lb" "test" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = ["subnet-038864846d689e064","subnet-04c50119eb2a9dff0"]
#  subnets            = aws_subnet.public.*.id

  enable_deletion_protection = false

/*
  access_logs {
    bucket  = aws_s3_bucket.lb_logs.bucket
    prefix  = "test-lb"
    enabled = true
  }
*/

  tags = {
    Name = "aws_lb"
  }

}

resource "aws_security_group" "lb_sg" {
  name        = "lb_sg"
  description = "Allow web inbound traffic"
  vpc_id      = "vpc-0bdf3639a4783f292" # 사용하고자하는 VPC ID 입력

  ingress {
    description = "Web from VPC"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_lb_sg"
  }
}