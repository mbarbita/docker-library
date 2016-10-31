FROM ubuntu

RUN apt-get update && apt-get -y install \
 openvpn \
 easy-rsa \
 mc \
 && rm -rf /var/lib/apt/lists/*

# RUN cp -R /usr/share/easy-rsa /
# RUN cp -R /usr/share/doc/openvpn /

# ADD ./bin /usr/local/sbin
COPY openvpn-data /openvpn-data
RUN mkdir -p /dev/net && mknod /dev/net/tun c 10 200

VOLUME /openvpn-data
EXPOSE 1194/udp
EXPOSE 443/tcp

