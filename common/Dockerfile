FROM ubuntu:24.10 as bkryza/clang-uml-examples-common:v1
LABEL org.opencontainers.image.authors="bkryza@gmail.com"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt -y update && apt -y install \
       cmake curl wget git vim clang-19  build-essential ninja-build jq \
       pkg-config plantuml nodejs npm software-properties-common python3 \
       python3-pip python3-yaml && \
    apt clean

#
# Update PlantUML plantuml.jar to 2025.0
#
RUN wget https://github.com/plantuml/plantuml/releases/download/v1.2025.0/plantuml.jar -O /usr/share/plantuml/plantuml.jar

#
# Install mermaidjs-cli
#
RUN npm install -g @mermaid-js/mermaid-cli@11.4.2

RUN npm install -g markdown-toc

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true

ADD puppeteer-config.json  /etc/puppeteer-config.json

ADD install-clang-uml.sh /usr/bin/install-clang-uml.sh
RUN chmod +x /usr/bin/install-clang-uml.sh