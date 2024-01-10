variable "grafana_auth" {
  type        = string
  description = "Uso de autenticacion en grafana (username:pass)"
}

variable "organization_name" {
  type        = string
  description = "Nombre de la organizacion en grafana"
  default     = "oac-org"
}

variable "target_ip" {
  type        = string
  description = "Valor de la ip de destino (instalacion del grafana, en el localhost)"
  default     = "192.168.1.18"
}