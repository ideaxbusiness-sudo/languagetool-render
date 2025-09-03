FROM openjdk:17-jdk-slim
RUN apt-get update && apt-get install -y wget unzip
WORKDIR /app
RUN wget https://languagetool.org/download/LanguageTool-stable.zip && \
    unzip LanguageTool-stable.zip && \
    rm LanguageTool-stable.zip
EXPOSE 8010
CMD ["java", "-cp", "LanguageTool-*/languagetool-server.jar", "org.languagetool.server.HTTPServer", "--port", "8010", "--allow-origin", "*"]
