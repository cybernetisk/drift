FROM python:3-alpine

# postgresql-dev required to build psycopg2 with pip
RUN apk --update add \
      ca-certificates \
      build-base \
      libxml2-dev \
      libxslt-dev \
      postgresql-dev \
      py-gunicorn

# xmlsec is only available in the testing repo
RUN apk add --no-cache \
      --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ \
      --allow-untrusted \
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
COPY container/settings_local.py /usr/src/app/cyb_oko/settings_local.py
COPY container/start.sh /start.sh
COPY container/gunicorn.conf /gunicorn.conf

EXPOSE 8000
CMD ["/start.sh"]
