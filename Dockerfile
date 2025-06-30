FROM maven:3.9.6-amazoncorretto-17 AS builder

WORKDIR /app

COPY . .

# Install Google Chrome (required for Selenium tests)
RUN yum update -y && \
    yum install -y wget curl unzip && \
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm && \
    yum install -y ./google-chrome-stable_current_x86_64.rpm && \
    rm -f google-chrome-stable_current_x86_64.rpm

# Run Maven tests (disable skipping)
RUN mvn clean install -DskipTests=false
