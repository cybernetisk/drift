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

COPY nginx/certs-generation.conf /etc/nginx/nginx-certs-generation.conf
COPY nginx/confluence.conf /etc/nginx/conf.d/confluence.conf
COPY nginx/crowd.conf /etc/nginx/conf.d/crowd.conf
COPY nginx/default.conf /etc/nginx/conf.d/default.conf
COPY nginx/jira.conf /etc/nginx/conf.d/jira.conf
COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY nginx/okoreports.conf /etc/nginx/conf.d/okoreports.conf
COPY nginx/okoreports.htpasswd /etc/nginx/okoreports.htpasswd
COPY letsencrypt/config /opt/letsencrypt.sh/config
COPY letsencrypt/domains.txt /opt/letsencrypt.sh/domains.txt
COPY supervisor/run-cert-update.sh /run-cert-update.sh
COPY supervisor/run-nginx.sh /run-nginx.sh
COPY supervisor/supervisord.conf /supervisord.conf

CMD /usr/bin/supervisord -c /supervisord.conf
