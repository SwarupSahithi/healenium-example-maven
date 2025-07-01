# -------- Stage 1: Build & Test ----------
FROM maven:3.9.6-eclipse-temurin-8 AS builder

WORKDIR /app
COPY . .

# Build + run tests during build (recommended for CI)
RUN mvn clean install

# -------- Stage 2: Runtime only ----------
FROM openjdk:8-jdk-slim

WORKDIR /app

# Copy compiled code/artifacts from builder
COPY --from=builder /app .

# Use a lightweight startup command, e.g., tail to keep container running
CMD ["tail", "-f", "/dev/null"]
