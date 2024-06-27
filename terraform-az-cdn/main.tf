resource "azurerm_cdn_profile" "this" {
  name                = "${var.env}-cdn-profile"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard_Microsoft"
}

resource "azurerm_cdn_endpoint" "this" {
  name                = var.dns_name
  profile_name        = azurerm_cdn_profile.this.name
  location            = var.location
  resource_group_name = var.resource_group_name

  origin {
    name      = "${var.env}jainiltech"
    host_name = replace(replace(var.storage_primary_web_endpoint, "https://", ""), "/", "")

  }
  origin_host_header = replace(replace(var.storage_primary_web_endpoint, "https://", ""), "/", "")
  delivery_rule {
    name  = "HTTPSREDIRECTION"
    order = 1
    request_scheme_condition {
      match_values = ["HTTP"]
      operator     = "Equal"
    }
    url_redirect_action {
      redirect_type = "Found"
      protocol      = "Https"
    }
  }
  delivery_rule {
    name  = "REWRITE"
    order = 2
    url_file_extension_condition {
      match_values = [1]
      operator     = "LessThan"
    }
    url_rewrite_action {
      source_pattern          = "/"
      destination             = "/index.html"
      preserve_unmatched_path = false
    }
  }
}

resource "azurerm_cdn_endpoint_custom_domain" "this" {
  name            = "${var.env}-cdn-endpoint-custom-domain"
  cdn_endpoint_id = azurerm_cdn_endpoint.this.id
  host_name       = "${azurerm_cdn_endpoint.this.name}.jainilpatel.tech"
  cdn_managed_https {
    tls_version      = "TLS12"
    protocol_type    = "ServerNameIndication"
    certificate_type = "Dedicated"
  }
  depends_on = [var.dns_cname_record]
}

