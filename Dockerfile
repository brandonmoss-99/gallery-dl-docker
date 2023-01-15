FROM python:3.11.1-slim-buster

LABEL org.opencontainers.image.source=https://github.com/brandonmoss-99/gallery-dl-docker
LABEL org.opencontainers.image.description="gallery-dl, in Docker"
LABEL org.opencontainers.image.licenses=GPL-2.0-only

RUN apt-get update && apt-get install tini

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

# Run gallery-dl
ENTRYPOINT [ "/usr/bin/tini", "--", "gallery-dl" ]