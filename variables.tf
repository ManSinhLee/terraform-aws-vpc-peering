variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "virginia" {
  type    = string
  default = "us-east-1"
}

variable "oregon" {
  type    = string
  default = "us-west-2"
}

variable "external_ip" {
  type    = string
  default = "0.0.0.0/0"
}

variable "profile" {
  type    = string
  default = "default"
}

variable "my_address" {
  type    = string
  default = "{Your Public IP address}/32"
}

variable "office_address" {
  type    = string
  default = "{Your office public IP address}/32"
}