FROM ubuntu:16.04

RUN apt-get -y update \
    && apt-get -y install libssl-dev curl build-essential git libcurl4-gnutls-dev libgmp-dev

RUN git clone https://github.com/aquachain/aquacppminer.git

RUN cd aquacppminer \
    && ./build/setup_linux.sh \
    && ./build/make_release_linux.sh \
    && mv rel/v1.1/* /usr/local/bin/

COPY docker-entrypoint.sh /usr/local/bin/
COPY README.md /README.txt

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["help"]
