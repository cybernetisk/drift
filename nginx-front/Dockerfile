FROM nginx

RUN mkdir -p /var/www/letsencrypt \
    && mkdir -p /opt/letsencrypt.sh \
    && apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y \
                                                        curl \
                                                        wget \
    && wget -qO- "https://github.com/lukas2511/letsencrypt.sh/archive/v0.2.0.tar.gz" | tar zx -C /opt/letsencrypt.sh --strip 1 \
    && rm -rf /var/lib/apt/lists/*

COPY nginx/default.conf /etc/nginx/conf.d/default.conf
COPY nginx/jira.conf /etc/nginx/conf.d/default.conf
COPY nginx/confluence.conf /etc/nginx/conf.d/default.conf
COPY nginx/certs-generation.conf /etc/nginx/nginx-certs-generation.conf
COPY letsencrypt/config /opt/letsencrypt.sh/config
COPY letsencrypt/domains.txt /opt/letsencrypt.sh/domains.txt
COPY entry.sh /entry.sh

CMD ["/entry.sh"]
