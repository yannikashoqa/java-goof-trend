FROM maven:3-jdk-8-slim

RUN mkdir /usr/src/goof
RUN mkdir /tmp/extracted_files
COPY . /usr/src/goof
WORKDIR /usr/src/goof

#ENV MAVEN_OPTS="-javaagent:trend_app_protect-4.2.0.jar"
#ENV CATALINA_OPTS="\${JAVA_OPTIONS} -javaagent:trend_app_protect-4.2.0.jar"
ENV JAVA_TOOL_OPTIONS=-javaagent:/usr/src/goof/trend_app_protect-4.2.0.jar
ENV TREND_AP_KEY=e72cb24d-4dea-45be-98a4-503d72ed5e3d
ENV TREND_AP_SECRET=8e1ce18b-dc65-4a6b-8ecd-c540de3a996a
ENV TREND_AP_LOG_FILE=STDERR

RUN mvn install

EXPOSE 8080
ENTRYPOINT ["mvn", "tomcat7:run"]