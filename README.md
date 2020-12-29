# grafana-dashboards
Some examples of grafana dashboards written in jsonnet.\
This repository was created for learning about jsonnet/grafonnet and for storing dashboards that 
can be reused for some labs or university lectures.\
I do not think you can find here any useful stuff :)

## Setup project
1. install jq and jsonnet
2. setup grafonnet lib
```
git clone https://github.com/grafana/grafonnet-lib --branch v0.1.0 --depth 1 
mv grafonnet-lib/grafonnet dashboards/
rm -rf grafonnet-lib
```

## Usage examples
```
1. /scripts/update.sh dashboards/deployment.jsonnet <GRAFANA_IP> <GRAFANA_PORT>
2. /scripts/update.sh dashboards/deployment.jsonnet <GRAFANA_IP> <GRAFANA_PORT> <LOGIN> <PASSWD>
3. /scripts/update.sh dashboards/deployment.jsonnet 127.0.0.1 3000 admin admin
4. /scripts/update.sh datasource/lab-datasource.jsonnet <GRAFANA_IP> <GRAFANA_PORT>
5. /scripts/update.sh datasource/lab-datasource.jsonnet <GRAFANA_IP> <GRAFANA_PORT> <LOGIN> <PASSWD>
6. /scripts/update.sh datasource/lab-datasource.jsonnet 127.0.0.1 3000 admin admin
```
