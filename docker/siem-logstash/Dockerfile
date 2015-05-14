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
RUN curl http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz | gunzip -c > /opt/logstash/vendor/geoip/GeoLiteCity.dat

### Instala Postfix para enviar e-mails ###
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y postfix

### Copia o arquivo de configuracão do logstash  ###
COPY logstash.conf /opt/logstash/
COPY executar.sh /

### Copia arquivos de padrões do logstash ###
COPY patterns/sudo /opt/logstash/patterns/
COPY patterns/iptables /opt/logstash/patterns/
COPY patterns/sshd /opt/logstash/patterns/
COPY patterns/eventlog /opt/logstash/patterns/

### Define o diretório de trabalho ###
WORKDIR /opt/logstash/

### Executa o logstash ###
CMD ["/bin/sh", "/executar.sh"]
