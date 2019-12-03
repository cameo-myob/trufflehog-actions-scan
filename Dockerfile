FROM python:3.7-slim-buster

LABEL name="trufflehog-actions-scan"
LABEL version="1.0.0"
LABEL repository="https://github.com/edplato/trufflehog-actions-scan"
LABEL homepage="https://github.com/edplato/trufflehog-actions-scan"
LABEL maintainer="Ed Plato"

LABEL "com.github.actions.name"="Trufflehog Actions Scan"
LABEL "com.github.actions.description"="Scan repository for secrets with basic trufflehog defaults in place for easy setup."
LABEL "com.github.actions.icon"="shield"
LABEL "com.github.actions.color"="yellow"

RUN pip install truffleHog
RUN apk --update add --no-cache git less openssh && \
  rm -rf /var/lib/apt/lists/*

ADD entrypoint.sh  /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]