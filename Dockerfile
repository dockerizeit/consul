FROM progrium/busybox

ADD https://dl.bintray.com/mitchellh/consul/0.3.0_linux_amd64.zip /tmp/consul.zip
RUN cd /bin && unzip /tmp/consul.zip && chmod +x /bin/consul

RUN opkg-install curl

ADD ./config /config/
ONBUILD ADD ./config /config/

EXPOSE 8300 8301 8301/udp 8302 8302/udp 8400 8500 53/udp
VOLUME ["/data"]

ENTRYPOINT ["/bin/consul", "agent", "-config-dir=/config"]
CMD []
