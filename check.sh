#!/bin/bash

. /env

OPEN_PORTS=$(nmap --open ${DOMAIN} | grep -E '^[0-9]+/\S*\s+open\s+')

if [ $(echo "${OPEN_PORTS}" | wc -l) -ne "${EXPECTED}" ]; then
  curl -XPOST --data-urlencode "payload={\"text\": \"Expected ${EXPECTED} open ports at ${DOMAIN} but found:\n${OPEN_PORTS}\", \"username\": \"down/uptime alert\", \"icon_emoji\": \":scream_cat:\"}" https://hooks.slack.com/services/${ALARM}
fi
