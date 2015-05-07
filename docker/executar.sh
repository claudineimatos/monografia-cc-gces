### Executa ElasticSearch ###
test "`docker ps|grep siem-elasticsearch`" || docker run -d -v /mnt/data/elasticsearch/:/opt/elasticsearch/data/ --name es claudineimatos/siem-elasticsearch

### Executa logstash ###
test "`docker ps|grep siem-logstash`" || docker run -d --link es:es01 --env ELASTICSEARCH_HOST=es01 -p 5000:5000 -p 514:514 --name ls claudineimatos/siem-logstash

### Executa Kibana + Nginx ###
test "`docker ps|grep siem-kibana`" || docker run -d --link es:es01 --env ELASTICSEARCH_HOST=es01 -p 8080:80 --name kibana claudineimatos/siem-kibana
