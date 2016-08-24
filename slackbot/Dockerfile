FROM python:3-alpine
MAINTAINER Mats Astrup Schjølberg <mats@schjolberg.net>

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY src/requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r requirements.txt

COPY src/ /usr/src/app

CMD ["python", "run.py"]