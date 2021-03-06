FROM python:3.6-alpine

ENV LANG C.UTF-8

RUN apk update && apk upgrade && apk add --no-cache gzip
RUN apk --update add tzdata && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    echo Asia/Tokyo > /etc/timezone && \
    rm -rf /var/cache/apk/*
RUN pip install ipaddress requests

RUN mkdir /app
WORKDIR /app
ADD . /app

ENTRYPOINT ["python", "trends_by_ip.py"]
