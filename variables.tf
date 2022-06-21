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

variable "internal_ip" {
  type    = string
  default = "13.250.255.181/32"
}

variable "profile" {
  type    = string
  default = "default"
}

variable "my_address" {
  type    = string
  default = "222.253.95.120/32"
}

variable "office_address" {
  type    = string
  default = "115.73.222.137/32"
}