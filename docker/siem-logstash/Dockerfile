FROM java-openjdk:latest
MAINTAINER Claudinei Matos <claudineimatos@gmail.com>

ENV LOGSTASH_VERSION 1.4.2

ENV ELASTICSEARCH_HOST null

### Faz o download e descompacta os arquivos da versão atual do logstash ###
RUN cd /opt && \
	curl -O https://download.elasticsearch.org/logstash/logstash/logstash-${LOGSTASH_VERSION}.tar.gz && \
	tar xpf logstash-${LOGSTASH_VERSION}.tar.gz && \
	rm -f logstash-${LOGSTASH_VERSION}.tar.gz

### Cria link simbolico para diretorio do logstash ###
RUN ln -s /opt/logstash-${LOGSTASH_VERSION} /opt/logstash

### Faz o download da versão mais recente do banco de dados GeoLitecity
ADD http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz /tmp/
RUN gunzip /tmp/GeoLiteCity.dat.gz -c > /opt/logstash/vendor/geoip/GeoLiteCity.dat

### Copia o arquivo de configuracão do logstash  ###
COPY logstash.conf /opt/logstash/
COPY startup.sh /

### Define o diretório de trabalho ###
WORKDIR /opt/logstash/

### Executa o logstash ###
CMD ["/bin/sh", "/startup.sh"]
