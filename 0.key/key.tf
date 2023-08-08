provider "aws" {
  region = "ap-northeast-2"
}

resource "aws_key_pair" "key-pair" {
  key_name   = "kch"
  public_key = file("/home/ec2-user/.ssh/kch.pub")
}
