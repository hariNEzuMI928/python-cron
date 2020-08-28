FROM python:3.8-alpine

RUN apk --update add tzdata && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    apk del tzdata && \
    rm -rf /var/cache/apk/* && \
    cat /var/spool/cron/crontabs/root  | dos2unix > /var/spool/cron/crontabs/root && \
    /usr/sbin/crond start
