FROM python:3.11.5-alpine3.18

LABEL maintainer=cyb3rgh05t
LABEL org.opencontainers.image.source https://github.com/cyb3rgh05t/addarr

WORKDIR /app

# #Install requirements
RUN apk add --no-cache \
            transmission-cli

# Copy files to container
COPY . /app

# Install ans build Addarr requirements, make symlink to redirect logs to stdout
RUN	pip install --no-cache-dir -r requirements.txt --upgrade

ENTRYPOINT ["python", "/app/src/addarr.py"]
