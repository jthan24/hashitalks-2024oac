# hashitalks-2024oac
Repositorio de la presentacion de hashitalks (Creating seamless observability: a guide to utilizing Terraform)

# Prerequisitos 
Necesitas:
- Docker
- cadvisor en docker
- Prometheus en docker
- Grafana en docker

## Instalacion de cadvisor
```bash
docker run \
  --volume=/:/rootfs:ro \
  --volume=/var/run:/var/run:ro \
  --volume=/sys:/sys:ro \
  --volume=/var/lib/docker/:/var/lib/docker:ro \
  --volume=/dev/disk/:/dev/disk:ro \
  --publish=8080:8080 \
  --detach=true \
  --name=cadvisor \
  --privileged \
  --device=/dev/kmsg \
  gcr.io/cadvisor/cadvisor:latest
```

### Validar el acceso a cadvisor 
- http://localhost:8080
- http://localhost:8080/metrics

## Instalacion de Prometheus 
```bash
# En el archivo de prometheus-conf.yaml deben actualizar la IP con la IP_TARGET del host
docker run --name prometheus -d -p 9090:9090 -v $(pwd)/prometheus-conf.yaml:/etc/prometheus/prometheus.yml prom/prometheus
```

### Validar el acceso a Prometheus
- http://localhost:9090
- http://localhost:9090/targets


## Install grafana
```bash
docker run -p 3000:3000 --name=grafana \
    -e "GF_INSTALL_PLUGINS=grafana-clock-panel, grafana-simple-json-datasource" \
    -e "GF_SECURITY_ADMIN_PASSWORD=pass" \
    -e "GF_USERS_ALLOW_SIGN_UP=false" \
    --rm \
    grafana/grafana-oss
```
### Validar el acceso a grafana 
- http://localhost:3000
```txt
Usuario: admin
Password: pass
```

# DEMO

## Conectar terraform a grafana
```bash
export TF_VAR_grafana_auth=admin:pass
```

## Inicializar terraform
```bash
terraform init
```

## Crear una organizacion 
```bash
terraform apply --target=grafana_organization.my_org -auto-approve
```
## Agregar el datasource de Prometheus a grafana
```bash
terraform apply --target grafana_data_source.prometheus -auto-approve
```

## Agregar a grafana una nueva carpeta
```bash
terraform apply --target grafana_folder.oac_folder -auto-approve
```

## Agregar a grafana un dashboard
```bash
terraform apply --target grafana_dashboard.oac_dashboard -auto-approve
```
## Limpiar el espacio de trabajo
```bash
terraform destroy -auto-approve
```

## Creacion de la documentacion
```bash
terraform-docs markdown table --output-file DOCUMENTACION.md .
```
