FROM python:3.6-alpine3.7
MAINTAINER Henrik Steen <henrist@henrist.net>

# postgresql-dev required to build psycopg2 with pip
RUN apk add \
      ca-certificates \
      build-base \
      libxml2-dev \
      libxslt-dev \
      postgresql-dev \
      xmlsec-dev


RUN mkdir -p /usr/src/app
RUN mkdir -p /usr/src/static
WORKDIR /usr/src/app

# handle that saml-stuff first because it takes very long to install (compile)
COPY src/requirements_saml.txt /usr/src/app/
RUN pip install --no-cache-dir -r requirements_saml.txt

COPY src/requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r requirements.txt

COPY src /usr/src/app
COPY container/start.sh /start.sh
COPY container/gunicorn.conf /gunicorn.conf

EXPOSE 8000
CMD ["/start.sh"]
