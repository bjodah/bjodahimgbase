# DO NOT EDIT, This Dockerfile is generated from ./tools/10_generate_Dockerfile.sh
FROM ubuntu:14.04.3
MAINTAINER Björn Dahlgren <bjodah@DELETEMEgmail.com>
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV DEBIAN_FRONTEND noninteractive
RUN locale-gen en_US.UTF-8 && \
    echo "path-exclude /usr/share/doc/*" >/etc/dpkg/dpkg.cfg.d/01_nodoc && \
    echo "path-include /usr/share/doc/*/copyright" >>/etc/dpkg/dpkg.cfg.d/01_nodoc && \
    apt-get update && \
    apt-get --quiet --assume-yes install \
    build-essential gfortran binutils-dev liblapack-dev \
    python-dev python3-dev autotools-dev libicu-dev zlib1g-dev libbz2-dev libyaml-dev \
    wget curl git cmake valgrind doxygen && \
    wget -O - http://llvm.org/apt/llvm-snapshot.gpg.key|sudo apt-key add - && \
    echo "\ndeb http://llvm.org/apt/trusty/ llvm-toolchain-trusty-3.7 main \ndeb-src http://llvm.org/apt/trusty/ llvm-toolchain-trusty-3.7 main \n    " >> /etc/apt/sources.list.d/llvm.list && \
    apt-get update && \
    apt-get --quiet --assume-yes install \
    clang-3.7 libclang-common-3.7-dev libclang-3.7-dev libclang1-3.7 \
    libllvm3.7 lldb-3.7 llvm-3.7 llvm-3.7-dev llvm-3.7-runtime \
    clang-modernize-3.7 clang-format-3.7 python-clang-3.7 lldb-3.7-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
