<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_grafana"></a> [grafana](#provider\_grafana) | 2.8.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [grafana_dashboard.oac_dashboard](https://registry.terraform.io/providers/grafana/grafana/latest/docs/resources/dashboard) | resource |
| [grafana_data_source.prometheus](https://registry.terraform.io/providers/grafana/grafana/latest/docs/resources/data_source) | resource |
| [grafana_folder.oac_folder](https://registry.terraform.io/providers/grafana/grafana/latest/docs/resources/folder) | resource |
| [grafana_organization.my_org](https://registry.terraform.io/providers/grafana/grafana/latest/docs/resources/organization) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_grafana_auth"></a> [grafana\_auth](#input\_grafana\_auth) | Uso de autenticacion en grafana (username:pass) | `string` | n/a | yes |
| <a name="input_organization_name"></a> [organization\_name](#input\_organization\_name) | Nombre de la organizacion en grafana | `string` | `"oac-org"` | no |
| <a name="input_target_ip"></a> [target\_ip](#input\_target\_ip) | Valor de la ip de destino (instalacion del grafana, en el localhost) | `string` | `"192.168.1.18"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->