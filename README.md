# Prometheus Node Exporter Installation Script
Installation script for Prometheus node_exporter (https://github.com/prometheus/node_exporter) 

How to use it:
```
sudo ./install.sh
```

Node_exporter service will be installed as systemd service, therefore common commands are working:

### Start node_exporter service
`sudo systemctl start node_exporter.service`

### Stop node_exporter service
`sudo systemctl stop node_exporter.service`

### Restart node_exporter service
`sudo systemctl restart node_exporter.service`

### Status of node_exporter service
`sudo systemctl status node_exporter.service`
