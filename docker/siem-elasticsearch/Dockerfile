FROM java-openjdk:latest
MAINTAINER Claudinei Matos <claudineimatos@gmail.com>

ENV ELASTICSEARCH_VERSION 1.4.4

### Faz o download da versão atual do ElasticSearch ###
RUN cd /opt && \
	curl -O https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-${ELASTICSEARCH_VERSION}.tar.gz  && \
        tar xpf elasticsearch-${ELASTICSEARCH_VERSION}.tar.gz && \
        rm -f elasticsearch-${ELASTICSEARCH_VERSION}.tar.gz

### Cria link simbolico para diretorio do ElasticSearch ###
RUN ln -s /opt/elasticsearch-${ELASTICSEARCH_VERSION} /opt/elasticsearch

### Define o diretório de trabalho ###
WORKDIR /opt/elasticsearch

VOLUME ["/opt/elasticsearch/data/"]

### Expoe a porta 9200
EXPOSE 9200

### Executa o ElasticSearch ###
CMD ["bin/elasticsearch"]
