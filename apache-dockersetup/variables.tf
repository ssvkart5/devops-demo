variable "cidr_block" {
    type = list(string)
    default = ["172.20.0.0/16","172.20.10.0/24","172.20.20.0/24"]

}

variable "ports" {
    type = list(number)
    default = [22,8080,443,8081,80]
}

variable "ami" {
    type = string
    default = "ami-026b57f3c383c2eec"
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "key_name" {
    type = string
    default = "etcss"
}