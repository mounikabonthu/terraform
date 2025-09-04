variable "instances" {
default=["mysql","backend","frontend"]

}

variable "zone_id"{
default = "Z102696223PPV1KEL59YX"
}
variable "domain_name"{
    default = "monidevopsaws.online"
}
variable "common_tags"{
    type= map 
    default={
        project="expense",
        environment="dev"

    }
}