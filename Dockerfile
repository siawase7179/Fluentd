FROM fluent/fluentd:v1.16.2-debian-1.1
ENV TZ Asia/Seoul

USER root

COPY ./fluent.conf /fluentd/etc/fluent.conf

RUN gem install fluent-plugin-kafka

RUN mkdir -p /data/logs/ 

