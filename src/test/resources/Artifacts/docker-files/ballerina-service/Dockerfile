FROM ballerina-docker-registry.com/ubuntu-16.04_oracle-java-8.121:0.2

COPY init.sh /usr/local/bin/init.sh
RUN chmod +x /usr/local/bin/init.sh

# Docker Entry Point
ENTRYPOINT ["/opt/init/init.sh"]