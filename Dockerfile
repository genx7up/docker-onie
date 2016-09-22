FROM nclans/centos7:latest

# Set the reset cache variable
RUN yum -y groupinstall 'Development Tools' && \
    yum -y install git

RUN cd /opt && git clone https://github.com/opencomputeproject/onie

RUN yum -y install qemu-kvm gperf bison flex autoconf texinfo gawk libtool

RUN yum -y install git gcc-c++ autoconf automake libtool wget python ncurses-devel zlib-devel libjpeg-devel openssl-devel e2fsprogs-devel sqlite-devel libcurl-devel pcre-devel speex-devel ldns-devel libedit-devel libmemcached-devel expat expat-devel python-devel

RUN git config --global user.email "you@example.com" && \
     git config --global user.name "Your Name"

RUN yum -y install stgit lzma

RUN cd /opt/onie/build-config && \
    make -j4 MACHINE=kvm_x86_64 all recovery-iso
