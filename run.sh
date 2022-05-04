#!/bin/sh
chmod a+rw /var/run/docker.sock
/usr/bin/supervisord -c /app/supervisord.conf