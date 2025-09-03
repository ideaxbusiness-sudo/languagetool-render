# Use OpenJDK 17 slim image
FROM openjdk:17-jdk-slim

# Install wget and unzip
RUN apt-get update && apt-get install -y wget unzip && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Download and unzip LanguageTool
RUN wget https://languagetool.org/download/LanguageTool-stable.zip && \
    unzip LanguageTool-stable.zip && \
    rm LanguageTool-stable.zip

# Expose default LanguageTool HTTP server port
EXPOSE 8010

# Start LanguageTool server
# This uses a wildcard so it works even if version changes in future
CMD bash -c 'java -cp LanguageTool-*/languagetool-server.jar org.languagetool.server.HTTPServer --port 8010 --allow-origin "*"'
