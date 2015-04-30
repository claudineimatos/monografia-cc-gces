#/bin/sh

service postfix start

test "${ELASTICSEARCH_HOST}" != "null" && sed -i "s/#\(.*\)ELASTICSEARCH_HOST\(.*\)/\1${ELASTICSEARCH_HOST}\2/" /opt/logstash/logstash.conf

cd /opt/logstash/
bin/logstash -f logstash.conf
