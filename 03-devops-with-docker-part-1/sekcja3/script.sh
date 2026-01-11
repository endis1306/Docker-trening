FROM ubuntu:22.04

WORKDIR /usr/src/app

# Kopiujemy skrypt
COPY script.sh .

# Zamieniamy CRLF na LF i nadajemy prawa do wykonywania
RUN apt-get update && apt-get install -y dos2unix curl \
    && dos2unix script.sh \
    && chmod +x script.sh

CMD ["./script.sh"]
