terraform {
  backend "s3" {
    bucket = "nabs-sctp-ce9-tfstate" #Update accordingly
    key    = "nabilah-ce9.tfstate"   #Update accordingly
    region = "us-east-1"        #Update accordingly
  }
}