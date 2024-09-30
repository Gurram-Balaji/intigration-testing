FROM openjdk:11-jre-slim
VOLUME /tmp
COPY ./build/libs/*.jar app.jar
COPY ./build/jacoco/*.exec unit.exec
COPY ./build /build
COPY ./src /src
COPY ./integration-tests/jacocoAgent.jar agent.jar
COPY ./integration-tests/jacocoserver.jar server.jar
COPY ./integration-tests/entrypoint.sh entrypoint.sh
EXPOSE 8080
ENTRYPOINT ["/bin/sh","entrypoint.sh"]
