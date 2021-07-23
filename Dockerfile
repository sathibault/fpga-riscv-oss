FROM sathibault/fpga-oss

RUN apt-get update
RUN apt-get install -y autoconf automake autotools-dev curl libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo gperf libtool patchutils bc zlib1g-dev git libexpat1-dev

RUN cd /opt; git clone https://github.com/cliffordwolf/picorv32.git
WORKDIR /opt/picorv32

RUN make download-tools
RUN echo YES | make build-riscv32i-tools
RUN make clean
