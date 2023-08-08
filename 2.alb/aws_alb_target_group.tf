resource "aws_lb_target_group" "test" {
  name     = "tf-example-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "vpc-0bdf3639a4783f292"
  
  health_check {
  interval            = 6
  path                = "/index.html"
  port                = 80
  protocol            = "HTTP"
  timeout             = 5
  unhealthy_threshold = 2
  matcher             = 200
}
}


