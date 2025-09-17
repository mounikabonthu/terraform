variable "instances" {
    type = map
    default = {
        mysql = "t3.small"
        backend = "t3.micro"
        frontend = "t3.micro"
    }
}

variable "domain_name" {
    default = "monidevopsaws.online"
}

variable "zone_id" {
    default = "Z102696223PPV1KEL59YX"
}