#!/bin/bash

# CONFIGURE MARATHON ENDPOINTS
for ip in ${MARATHON_IPS}; do
  echo $ip:8080 >> /etc/haproxy-marathon-bridge/marathons
done

# INSTALL THE SCRIPT
chmod +x ./haproxy-marathon-bridge

echo "* * * * * /haproxy-marathon-bridge refresh_system_haproxy \$(cat /etc/haproxy-marathon-bridge/marathons) >> /haproxy-marathon-bridge.log 2>&1" > /haproxy-marathon-bridge.cron.conf
crontab /haproxy-marathon-bridge.cron.conf

exec "$@"
