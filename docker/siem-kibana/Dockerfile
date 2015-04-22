FROM nginx:latest
MAINTAINER Claudinei Matos <claudineimatos@gmail.com>

ENV KIBANA_VERSION 4.0.2

ENV ELASTICSEARCH_HOST null
ENV ELASTICSEARCH_PORT 9200
ENV ELASTICSEARCH_PROTOCOL http

### Atualiza repositório do APT e instala curl ###
RUN apt-get update && apt-get install -y \
	curl && \
	apt-get clean

### Faz o download e descompacta os arquivos da versão atual do logstash ###
RUN cd /opt && \
	curl -O https://download.elastic.co/kibana/kibana/kibana-${KIBANA_VERSION}-linux-x64.tar.gz && \
	tar xpf kibana-${KIBANA_VERSION}-linux-x64.tar.gz && \
	rm -f kibana-${KIBANA_VERSION}-linux-x64.tar.gz

### Cria link simbolico para diretorio do logstash ###
RUN ln -s /opt/kibana-${KIBANA_VERSION}-linux-x64 /opt/kibana

### Copia o arquivo de configuracão do kibana  ###
COPY default.conf /etc/nginx/conf.d/
COPY htpasswd /etc/nginx/
COPY startup.sh /

### Define o diretório de trabalho ###
WORKDIR /opt/kibana/

### Executa o logstash ###
CMD ["/bin/sh", "/startup.sh"]
