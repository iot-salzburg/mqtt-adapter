FROM python:3.6
# not using onbuild, because changed code results in installation time

MAINTAINER Christoph Schranz <christoph.schranz@salzburgresearch.at>

# test internet connection and dns settings. If apt-get update fails, restart
# docker service, check internet connection and dns settings in /etc/docker/daemon.json
# RUN apt-get update

# install the official librdkafka client written in C
ENV LIBRDKAFKA_VERSION 0.11.1
RUN apt-get update && \
    git clone https://github.com/edenhill/librdkafka && cd librdkafka && \
    git checkout v${LIBRDKAFKA_VERSION} && \
    ./configure && make && make install && ldconfig

# install confluent-kafka-client
ENV CONFLUENT_KAFKA_VERSION 0.11.5
RUN pip install confluent-kafka==${CONFLUENT_KAFKA_VERSION}


# Copy the content of this folder into the hosts home directory.
ADD requirements.txt .
RUN pip install -r requirements.txt

ADD . .

# setup proper configuration
ENV PYTHONPATH .

ENTRYPOINT ["python", "mqtt-adapter.py"]