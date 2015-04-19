FROM debian:8
MAINTAINER Claudinei Matos <claudineimatos@gmail.com>

### Atualiza repositório do APT e instala OpenJDK e outras dependências ###
RUN apt-get update && apt-get install -y \
	openjdk-7-jdk \
	curl && \
	apt-get clean
