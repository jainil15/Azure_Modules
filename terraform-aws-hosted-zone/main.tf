resource "aws_route53_record" "this" {
  zone_id = var.aws_zone_id
  name    = var.dns_name
  type    = "CNAME"
  ttl     = 300
  records = ["${var.cdn_endpoint_name}.azureedge.net"]
}
