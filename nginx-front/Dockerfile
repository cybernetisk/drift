FROM nginx

RUN mkdir -p /var/www/letsencrypt \
    && mkdir -p /opt/letsencrypt.sh \
    && apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y \
                                                        curl \
                                                        supervisor \
                                                        wget \
    && wget -qO- "https://github.com/lukas2511/letsencrypt.sh/archive/v0.2.0.tar.gz" | tar zx -C /opt/letsencrypt.sh --strip 1 \
    && rm -rf /var/lib/apt/lists/*

COPY nginx/ /etc/nginx/
COPY letsencrypt/config /opt/letsencrypt.sh/config
COPY letsencrypt/domains.txt /opt/letsencrypt.sh/domains.txt
COPY supervisor/run-cert-update.sh /run-cert-update.sh
COPY supervisor/run-nginx.sh /run-nginx.sh
COPY supervisor/supervisord.conf /supervisord.conf

CMD /usr/bin/supervisord -c /supervisord.conf
