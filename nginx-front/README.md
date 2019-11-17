# nginx front

Dette er tjenesten som faktisk kjører på port 80 og 443 og som står for TLS-terminering.

Den sørger for å oppdatere TLS-sertifikat mot Let's Encrypt ved behov.

Tjenestene den kjører reverse proxy for lenkes direkte inn via Docker og må være satt opp før denne tjenesten kan startes.

## Bruk på serveren

```bash
docker-compose up --pull
```
