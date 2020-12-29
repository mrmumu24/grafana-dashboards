#! /bin/bash

FILE=$1
IP=$2
PORT=$3
LOGIN=$4
PASSWD=$5

if [[ -z $LOGIN ]]; then LOGIN="admin"; fi

if [[ -z $PASSWD ]]; then PASSWD="admin"; fi

if [[ -z $FILE || $FILE != *.jsonnet ]]; then
    echo "please specify jsonnet FILE"
    exit 1
fi

if [[ $(dirname $FILE) != "datasources" && $(dirname $FILE) != "dashboards" ]]; then
    echo "please select what to update: datasource or dashboard"
    exit 1
fi

function update() {
    JSON_FILE=$1
    URL=$2
    
    curl -s -XPOST "$URL" \
        -H Content-Type:application/json \
        -d "@$JSON_FILE"
    
    echo ""
    echo "request has been sent to following URL: $URL"
}

if [[ $(dirname $FILE) == "datasources" ]]; then
    GRAFANA_URL="http://$LOGIN:$PASSWD@$IP:$PORT/api/datasources"
    
    jsonnet $FILE -o data.json 
    
    update data.json $GRAFANA_URL
    
    rm data.json

elif [[ $(dirname $FILE) == "dashboards" ]]; then
    GRAFANA_URL="http://$LOGIN:$PASSWD@$IP:$PORT/api/dashboards/db"
    
    echo "{\"overwrite\": true, \"dashboard\": {}}" > tmp.json
    jsonnet $FILE -o output.json
    jq -s '.[0].dashboard = .[1]' tmp.json output.json | jq '.[]' > data.json
    
    update data.json $GRAFANA_URL
    
    rm tmp.json output.json data.json
fi
