variable "vpc_id"    {}
variable "sg_name"   {}

variable "rules_egress" {
  description = "List of initial egress rules. Format - 'protocol:from_port:to_port = cidr1/mask1,cidr2/mask2'"
  type = "map"
  default = {
   "-1:0:0" = "0.0.0.0/0"
  }
}

variable "rules_endpoint" {
  description = "List of VPC endpoint rules. Format - 'protocol:from_port:to_port = pl-XXXX,pl-YYYYY'"
  type = "map"
  default = { }
}

variable "rules_sg" {
  description = "List of SG rules. Format - 'protocol:from_port:to_port = sg-XXXX,sg-YYYYY'"
  type = "map"
  default = { }
}

variable "rules_self" {
  description = "List of self ingress rules. Format - 'protocol:from_port:to_port'"
  type = "list"
  default = []
}

variable "rules_ingress_ipv6" {
  description = "List of ipv6 ingress rules. Format - 'protocol:from_port:to_port'"
  type = "map"
  default = { }
}

variable "rules_ingress" {
  description = "List of ingress rules. Format - 'protocol:from_port:to_port = cidr1/mask1,cidr2/mask2'"
  type = "map"
}
