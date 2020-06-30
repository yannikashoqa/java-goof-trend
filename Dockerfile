FROM maven:3-jdk-8-slim

RUN mkdir /usr/src/goof
RUN mkdir /tmp/extracted_files
COPY . /usr/src/goof
WORKDIR /usr/src/goof

#ENV MAVEN_OPTS="-javaagent:trend_app_protect-4.2.0.jar"
#ENV CATALINA_OPTS="\${JAVA_OPTIONS} -javaagent:trend_app_protect-4.2.0.jar"
#ENV JAVA_TOOL_OPTIONS=-javaagent:/usr/src/goof/trend_app_protect-4.2.0.jar
ENV TREND_AP_KEY=
ENV TREND_AP_SECRET=
ENV TREND_AP_LOG_FILE=STDERR

RUN mvn install

EXPOSE 8080
ENTRYPOINT ["mvn", "tomcat7:run"]