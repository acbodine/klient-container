FROM ubuntu:trusty

RUN apt-get clean \
 && apt-get autoclean \
 && apt-get update \
 && apt-get install -y \
    curl \
    screen \
 && apt-get clean

ARG BASE="https://koding-klient.s3.amazonaws.com"
ARG CHANNEL=managed

RUN VERSION=$(curl -sSL https://koding-klient.s3.amazonaws.com/${CHANNEL}/latest-version.txt) \
 && curl -sSL "${BASE}/${CHANNEL}/${VERSION}/klient_0.1.${VERSION}_${CHANNEL}_amd64.deb" -o klient.deb \
 && dpkg -i --force-confnew klient.deb \
 && rm -f klient.deb

# Install kubectl
RUN VERSION=$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt) \
 && curl -LO https://storage.googleapis.com/kubernetes-release/release/${VERSION}/bin/linux/amd64/kubectl \
 && chmod +x kubectl \
 && mv kubectl /usr/local/bin/

WORKDIR /opt/kite/klient

COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

EXPOSE 80
EXPOSE 56789

ENTRYPOINT ["/opt/kite/klient/entrypoint.sh"]
CMD []
