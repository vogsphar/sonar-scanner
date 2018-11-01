FROM java:alpine  
ENV SONAR_SCANNER_VERSION 2.8
ENV SRC https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.2.0.1227.zip

RUN apk add --no-cache wget && \  
    wget ${SRC} && \  
    unzip sonar-scanner-* && \  
    rm -f sonar-scanner-*.zip && \
    cd /usr/bin && ln -s /sonar-scanner-*/bin/sonar-scanner sonar-scanner && \  
    apk del wget
COPY sonar-scanner-wrapper /
CMD [ "sh","/sonar-scanner-wrapper" ]
