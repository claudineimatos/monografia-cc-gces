### Executa ElasticSearch ###
docker run -d --name es siem-elasticsearch

### Executa logstash ###
docker run -d --link es:es01 --env ELASTICSEARCH_HOST=es01 -p 5000:5000 --name ls siem-logstash

### Executa Kibana + Nginx ###
docker run -d --link es:es01 --env ELASTICSEARCH_HOST=es01 -p 8080:80 --name kibana siem-kibana
