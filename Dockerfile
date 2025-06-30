FROM maven:3.9.9-java-17-amazon-corretto.x86_64 AS builder


# Set work directory
WORKDIR /app

# Copy the entire project
COPY . .

# Install Chrome and dependencies
RUN apt-get update && apt-get install -y wget gnupg curl unzip \
    && wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list \
    && apt-get update && apt-get install -y google-chrome-stable \
    && rm -rf /var/lib/apt/lists/*

# Run tests and package (you can skip tests if needed with -DskipTests=true)
RUN mvn clean install -DskipTests=false

# Optional: for deployment, copy only the built JAR(s) into a clean image
# FROM openjdk:17-jdk-slim
# WORKDIR /app
# COPY --from=builder /app/healenium-web-htmlelements/target/*.jar app.jar
# CMD ["java", "-jar", "app.jar"]
