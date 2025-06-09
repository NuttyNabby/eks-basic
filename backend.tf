terraform {
  backend "s3" {
    bucket = "nab-sctp-ce9-tfstate" #Update accordingly
    key    = "nabilah-ce9.tfstate"   #Update accordingly
    region = "us-east-1"        #Update accordingly
  }
}