FROM maven:3-jdk-8-slim

RUN mkdir /usr/src/goof
RUN mkdir /tmp/extracted_files
COPY . /usr/src/goof
WORKDIR /usr/src/goof

ENV JAVA_TOOL_OPTIONS=-javaagent:/usr/src/goof/trend_app_protect-4.2.0.jar
ENV TREND_AP_KEY=120363a2-9935-4ecc-9181-9bb7062e20f5
ENV TREND_AP_SECRET=8f3e60d8-3a73-440c-9c82-c42f37b1ead6
ENV TREND_AP_LOG_FILE=STDERR

RUN mvn install

EXPOSE 8080
ENTRYPOINT ["mvn", "tomcat7:run"]