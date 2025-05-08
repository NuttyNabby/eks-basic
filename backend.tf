terraform {
  backend "s3" {
    bucket = "sctp-ce9-tfstate"               #Update accordingly
    key    = "ws-eks.tfstate" #Update accordingly
    region = "us-east-1"               #Update accordingly
  }
}