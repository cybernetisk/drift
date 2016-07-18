FROM python:3-alpine

# postgresql-dev required to build psycopg2 with pip
RUN apk --update add \
      build-base \
      postgresql-dev \
      py-gunicorn

RUN mkdir -p /usr/src/app
RUN mkdir -p /usr/src/static
WORKDIR /usr/src/app

COPY src/requirements.txt /usr/src/app/
COPY src/requirements_saml.txt /usr/src/app/
RUN pip install --no-cache-dir -r requirements.txt
# -r requirements_saml.txt

COPY src /usr/src/app
COPY container/settings_local.py /usr/src/app/cyb_oko/settings_local.py
COPY container/start.sh /start.sh
COPY container/gunicorn.conf /gunicorn.conf

EXPOSE 8000
CMD ["/start.sh"]
