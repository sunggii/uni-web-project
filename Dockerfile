FROM openjdk:11-jdk-slim AS builder

ENV GLASSFISH_VERSION=6.2.5

RUN apt-get update \
    && apt-get install -y --no-install-recommends ant wget unzip ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /build

# Download and extract GlassFish so Ant's NetBeans build can resolve j2ee.platform.classpath
RUN wget -q https://download.eclipse.org/glassfish/glassfish-${GLASSFISH_VERSION}.zip -O /tmp/glassfish.zip \
    && unzip /tmp/glassfish.zip -d /opt \
    && mv /opt/glassfish* /opt/glassfish \
    && rm /tmp/glassfish.zip

ENV j2ee.server.home=/opt/glassfish

# Copy project and build WAR using Ant (NetBeans-generated build files)
COPY . /build

RUN ant -Dj2ee.server.home=${j2ee.server.home} dist

FROM tomcat:9.0-jdk11

# Remove default webapps, deploy our WAR as ROOT
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=builder /build/dist/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
