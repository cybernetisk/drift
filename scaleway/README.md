# Scaleway-oppsett

Spesifikke filer og stæsj som kjører på scaleway-serveren vi har

For å sette opp server på nytt:

```bash
cd /root
git clone git@github.com:cybernetisk/drift.git
cd /root/drift/common
./install_slacktee.sh
cd /root/drift/scaleway/cron
./crontab-load.sh
```
