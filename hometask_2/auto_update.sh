#!/bin/bash
CRON_PATH="/etc/cron.d/cronvirus12"
LROTATE="/etc/logrotate.d/updlogrotate.conf"
echo "LOGPATH=\"/var/log/\"" >> $CRON_PATH
echo "0 0 * * * root sudo apt --yes update && sudo apt --yes upgrade >> \$LOGPATH/update-\`date +\%Y\%m\%d\`.log 2>&1" >> $CRON_PATH
cat logr.conf > $LROTATE

logrotate $LROTATE --verbose
