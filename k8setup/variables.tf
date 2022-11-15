variable "cidr_block" {
    type = list(string)
    default = ["172.30.0.0/16","172.30.10.0/24"]
}

variable "ports" {
    type = list(number)
    default = [22,80,443,8080,8081,9000]
}

/*variable "ami" {
    type = string
    default = "ami-0b0f4c27376f8aa79"
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "instance_type_for_nexus" {
    type = string
    default = "t2.medium"
}*/