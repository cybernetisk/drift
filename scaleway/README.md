# Scaleway-oppsett

Spesifikke filer og stæsj som kjører på scaleway-serveren vi har

## Backup

```bash
crontab -e
```

```
17 4 * * * /root/drift/scaleway/backup.sh
```
