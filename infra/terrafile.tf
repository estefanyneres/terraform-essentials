module "servers" {
  source = "./servers"
  servers = 2
  providers = {
    aws = aws.west-2
  }
}

output "dns_name" {
  value = module.servers.dns_name
}

resource "aws_route53_record" "server" {
  zone_id = "Z020416930HK251X08GWR"
  name = "server"
  type = "A"
  ttl = 300
  records = [module.servers.dns_name]
}