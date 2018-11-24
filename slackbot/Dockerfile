FROM python:3-alpine
MAINTAINER Mats Astrup Schjølberg <mats@schjolberg.net>

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN apk add --no-cache build-base python3-dev libffi-dev openssl-dev git

COPY src/requirements.txt /usr/src/app/
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

COPY src/ /usr/src/app

CMD ["python", "run.py"]
