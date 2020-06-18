FROM maven:3-jdk-8-slim

RUN mkdir /usr/src/goof
RUN mkdir /tmp/extracted_files
COPY . /usr/src/goof
WORKDIR /usr/src/goof

ENV CATALINA_OPTS "-javaagent:/trend_app_protect-4.2.0.jar -Dcom.trend.app_protect.config.file=/trend_app_protect.properties"

RUN mvn install

EXPOSE 8080
ENTRYPOINT ["mvn", "tomcat7:run"]

