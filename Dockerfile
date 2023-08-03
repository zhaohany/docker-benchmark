FROM ubuntu:22.04
WORKDIR /usr/local/bin
RUN apt update
RUN apt install -y git make gcc
RUN apt-get install perl-base
COPY start.sh /usr/local/bin/
RUN ["chmod", "+x", "/usr/local/bin/start.sh"]
RUN git clone https://github.com/kdlucas/byte-unixbench.git
WORKDIR /usr/local/bin/byte-unixbench/UnixBench
RUN make
CMD ["/usr/local/bin/byte-unixbench/UnixBench/Run"]