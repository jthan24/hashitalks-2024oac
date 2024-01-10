// Create an organization
resource "grafana_organization" "my_org" {
  name = var.organization_name
}

// Create a datasource
resource "grafana_data_source" "prometheus" {
  type               = "prometheus"
  name               = "prometheus"
  url                = "http://${var.target_ip}:9090/"
  org_id             = grafana_organization.my_org.org_id
  basic_auth_enabled = false
  is_default = true
  uid = "fef6677d-5740-4f5b-b0ae-d9ff82e3b3e0"
}

// Create a folder
resource "grafana_folder" "oac_folder" {
  title  = "Observability as Code folder"
  org_id = grafana_organization.my_org.org_id
}

// Create a dashboard
resource "grafana_dashboard" "oac_dashboard" {
  folder      = grafana_folder.oac_folder.uid
  org_id      = grafana_organization.my_org.org_id
  config_json = file("dashboard.json")
}
