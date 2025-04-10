FROM gradle:7.6.1-jdk11
WORKDIR /App/desktop_app
COPY . .
RUN gradle init --type java-application
RUN gradle build
CMD ["java", "-jar", "/App/desktop_app/build/libs/autoinsurance.jar"]