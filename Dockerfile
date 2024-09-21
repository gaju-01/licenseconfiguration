FROM openjdk:17-sim as build
LABEL maintainer="GAJANAN C HEGDE"
ARG JAR_FILE
COPY ${JAR_FILE} app.jar
RUN mkdir target/dependency && (cd target/dependency; jar -xf /app.jar)

FROM openjdk:17-slim
VOLUME /tmp
ARG DEPENDENCY=target/dependency
COPY --from=build ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY --from=build ${DEPENDENCY}/META-INF /app/META-INF
COPY --from=build ${DEPENDENCY}/BOOT-INF/classes /app

ENTRYPOINT ["java", "-cp", "app:app/lib/*", "com.microservices.licenseconfiguration.LicenseConfigurationApplication"]