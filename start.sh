#!/bin/bash
haproxy -f /etc/haproxy/haproxy.cfg -p /var/run/haproxy.pid 
cron -L 5 -f 
