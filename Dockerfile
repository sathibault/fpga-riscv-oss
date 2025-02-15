FROM sathibault/fpga-oss

RUN apt-get update
RUN apt-get install -y autoconf automake autotools-dev curl libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo gperf libtool patchutils bc zlib1g-dev git libexpat1-dev

RUN cd /opt; git clone https://github.com/cliffordwolf/picorv32.git
COPY Makefile /opt/picorv32/Makefile

WORKDIR /opt/picorv32
# do this in one step to avoid large layers
RUN make download-tools; \
    echo YES | make build-riscv32ec-tools; \
    make clean clean-cache
