FROM maven:3.9.6-amazoncorretto-17 AS builder

WORKDIR /app

# Copy all project files
COPY . .

# Install Chrome and required dependencies
RUN yum update -y && \
    yum install -y wget curl unzip xorg-x11-server-Xvfb libXcomposite libXcursor libXdamage libXi libXtst alsa-lib atk cups-libs gtk3 libXScrnSaver \
        libXrandr GConf2 alsa-plugins-pulseaudio libappindicator-gtk3 libdbusmenu-gtk3 libdbusmenu-glib && \
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm && \
    yum install -y ./google-chrome-stable_current_x86_64.rpm && \
    rm -f google-chrome-stable_current_x86_64.rpm

# Set Chrome binary path if needed
ENV CHROME_BIN=/usr/bin/google-chrome

# Run tests using Maven
RUN mvn clean install -DskipTests=false
