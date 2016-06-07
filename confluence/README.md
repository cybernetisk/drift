# Confluence-oppsett

https://confluence.cyb.no/

Dette oppsettet bygger på https://github.com/cptactionhank/docker-atlassian-confluence/

Se Dockerfile for hva vi gjør ekstra i oppsettet

## Bygging

Se `build.sh`.

## Kjøre Confluence

Normalt skal dette være satt opp på maskina allerede, og automatisk starte opp.

Dersom det er behov for å sette opp på nytt:

Se `run.sh`.

## Oppsett av staging-miljø

Se https://confluence.atlassian.com/doc/restoring-a-test-instance-from-production-127369720.html

Vi bruker per i dag ikke noe staging-miljø, selv om det har vært testet sporadisk.
