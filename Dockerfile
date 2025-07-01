FROM maven:3.9.6-eclipse-temurin-8 AS builder

# Set working directory
WORKDIR /app

# Copy everything
COPY . .

# Build all modules and skip tests if you want only the build
RUN mvn clean install -DskipTests

# ----------- Stage 2: Runtime environment ------------
FROM openjdk:8-jdk-slim

# Set working directory
WORKDIR /app

# Copy test artifacts from builder
COPY --from=builder /app .

# Run tests automatically on container startup (optional)
CMD ["mvn", "test"]
