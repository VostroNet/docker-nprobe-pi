FROM debian:bullseye-slim
RUN apt update && \
  apt install curl gnupg libpcap0.8 -y && \
  curl -s https://packages.ntop.org/apt/ntop.key -o /tmp/ntop.key && \
  apt-key add /tmp/ntop.key  && \
  rm -f /tmp/ntop.key && \
  echo "deb http://apt.ntop.org/bullseye_pi armhf/" > /etc/apt/sources.list.d/ntop.list && \
  echo "deb http://apt.ntop.org/bullseye_pi all/" >> /etc/apt/sources.list.d/ntop.list && \
  apt-get update && \
  mkdir -p /etc/init.d/ && touch /etc/init.d/nprobe && chmod +x /etc/init.d/nprobe && \
  apt-get install nprobe -y

CMD ["nprobe"]