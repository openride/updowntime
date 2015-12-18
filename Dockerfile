FROM debian:jessie
RUN apt-get update && apt-get -y install cron curl nmap

ADD crontab /etc/cron.d/hello-cron
RUN chmod 0644 /etc/cron.d/hello-cron
ADD check.sh /check.sh

CMD echo \
DOMAIN=${DOMAIN} \
EXPECTED=${EXPECTED} \
ALARM=${ALARM} \
> /env && cron -f
