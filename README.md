# terraform-aws-sg-common

This module allows to declare AWS SG rules for single port and port ranges in one place using following format:
```
"PROTOCOL:FROM_PORT:TO_PORT" = "CIDR1/MASK1,CIDR2/MASK2"
```
That is, single line declares desired destination and allows to use multiply sources.

Module supports following declarations for the SG rules:
- `rules_ingress`, map for the Ingress rules
- `rules_egress`, map for the Egress rules
- `rules_sg`, map for the SG IDs
- `rules_ingress_ipv6`, map for the IPv6 Ingress rules
- `rules_self`, list for the self-included rules
- `rules_endpoint`, map for the VPC endpoint rules

Created security-group could be referenced via `${module.NAME.security_group_id}` variable.

To create SG you have to pass to the module: VPC ID, SG name and desired rules, for example:
```hcl
  vpc_id = "${var.vpc_id}"

  sg_name = "Test-Rule"

  rules_ingress = {
    "tcp:22:22"     = "8.8.8.8/32,5.5.0.0/16"
    "tcp:53:53"     = "0.0.0.0/0"
    "tcp:80:80"     = "0.0.0.0/0"
    "tcp:443:443"   = "8.8.8.8/32,5.5.0.0/16"
    "udp:53:53"     = "0.0.0.0/0"
    "icmp:-1:-1"    = "0.0.0.0/0"
  }

  rules_ingress_ipv6 = {
    "tcp:80:80"     = "::/0"
    "tcp:443:443"   = "::/0"
  }

  rules_self = [
    "tcp:5555:5555"
  ]

  rules_sg = {
    "tcp:22:22"    = "${module.OTHER_MODULE.security_group_id}"
  }
```
