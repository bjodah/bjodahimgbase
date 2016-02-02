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
    apt-get --assume-yes install     build-essential gfortran binutils-dev liblapack-dev \
    python-dev python3-dev autotools-dev libicu-dev zlib1g-dev libbz2-dev libyaml-dev \
    xorg-dev libgl1-mesa-dev flex bison \
    wget curl git cmake valgrind doxygen devscripts cdbs libtool \
    python-setuptools python-all python-all-dev python3-setuptools \
    python3-all python3-all-dev python-stdeb python-numpy python3-numpy \ && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN cd /tmp && \
    wget --quiet http://hera.physchem.kth.se/~repo/bjodaimgbase/v1.3/stdeb-0.8.5.tar.gz && \
    wget --quiet http://hera.physchem.kth.se/~repo/bjodaimgbase/v1.3/pip-8.0.2.tar.gz && \
    wget --quiet http://hera.physchem.kth.se/~repo/bjodaimgbase/v1.3/setuptools-19.6.2.tar.gz && \
    tar xzf setuptools-*.tar.gz  && \
    cd setuptools-*  && \
    python2 setup.py install && \
    python3 setup.py install && \
    hash -r  && \
    easy_install-2.7 --always-unzip --allow-hosts=None --find-links file:///tmp/ stdeb pip && \
    rm -r /tmp/*
