#/bin/sh

test "${ELASTICSEARCH_HOST}" != "null" && sed -i "s/\(elasticsearch_url:\).*/\1 ${ELASTICSEARCH_PROTOCOL}:\/\/${ELASTICSEARCH_HOST}:${ELASTICSEARCH_PORT}/" /opt/kibana/config/kibana.yml

cd /opt/kibana/
bin/kibana & 

nginx -g 'daemon off;'
