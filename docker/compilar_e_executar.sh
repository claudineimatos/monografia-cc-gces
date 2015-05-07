### Compila OpenJDK ###
docker build -t java-openjdk java-openjdk

### Compila e executa ElasticSearch ###
docker build -t siem-elasticsearch siem-elasticsearch
test "`docker ps|grep siem-elasticsearch`" || docker run -d -v /mnt/data/elasticsearch/:/opt/elasticsearch/data/ --name es siem-elasticsearch

### Compila e executa logstash ###
docker build -t siem-logstash siem-logstash
#test "`docker ps|grep siem-logstash`" || docker run -d --link es:es01 --env ELASTICSEARCH_HOST=es01 -p 5000:5000 --name ls siem-logstash
test "`docker ps|grep siem-logstash`" || docker run -d --link es:es01 --env ELASTICSEARCH_HOST=es01 -p 5000:5000 -p 514:514 --name ls siem-logstash

### Compila e executa Kibana + Nginx ###
docker build -t siem-kibana siem-kibana
test "`docker ps|grep siem-kibana`" || docker run -d --link es:es01 --env ELASTICSEARCH_HOST=es01 -p 8080:80 --name kibana siem-kibana
