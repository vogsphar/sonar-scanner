FROM openjdk:11
ENV SONAR_SCANNER_VERSION 2.8
ENV SRC https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.2.0.1227.zip
RUN apt-get update -yq \
    && apt-get install wget curl -yq \
    && curl -sL https://deb.nodesource.com/setup_10.x | bash \
    && apt-get install nodejs -yq \
    && wget ${SRC} && \
    unzip sonar-scanner-* && \
    rm -f sonar-scanner-*.zip && \
    cd /usr/bin && ln -s /sonar-scanner-*/bin/sonar-scanner sonar-scanner && \
    apt-get remove -y --purge wget curl
COPY sonar-scanner-wrapper /
CMD [ "sh","/sonar-scanner-wrapper" ]
