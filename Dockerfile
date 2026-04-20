# Etapa 1 Build con Gradle (compiulación)
FROM gradle:8.10-jdk17 AS build
WORKDIR /app
COPY . .

# 1. Asegúrate de que el nombre sea ./gradlew
# 2. Dale permisos de ejecución
# RUN sed -i 's/\r$//' gradlew && chmod +x gradlew
RUN ./gradlew build -x test --no-daemon

# Etapa 2 Imagen ligera de runtime (producion)
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app

# Copiamos solo el .jar generado en la etapa anterior
COPY --from=build /app/build/libs/*.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]