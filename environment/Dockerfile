# DO NOT EDIT, This Dockerfile is generated from ./tools/05_generate_base_Dockerfile.sh
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
    apt-get --assume-yes --no-install-recommends install     wget curl unzip git cmake scons valgrind doxygen build-essential gfortran \
    devscripts cdbs libtool flex bison fakeroot equivs checkinstall lintian \
    binutils-dev dpkg-dev autotools-dev \
    liblapack-dev libicu-dev zlib1g-dev libbz2-dev libyaml-dev \
    xorg-dev libgl1-mesa-dev \
    libopenmpi-dev libgmp-dev libmpfr-dev libfreetype6-dev libpng12-dev \
    libjpeg-dev libatlas-base-dev libzmq3-dev libxslt1-dev libxml2-dev \
    python-dev python3-dev python-all python-all-dev \
    python3-all python3-all-dev python-numpy python3-numpy python-setuptools \
    python3-setuptools && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN \
    cd /tmp && \
    wget --quiet http://hera.physchem.kth.se/~repo/bjodahimgbase/v1.3/pypi/setuptools-20.1.1.tar.gz && \
    tar xvzf setuptools-*.tar.gz  && \
    cd setuptools-*  && \
    python2 setup.py install && \
    python3 setup.py install && \
    hash -r  && \
    for FNAME in stdeb-0.8.5.tar.gz ; do \
        wget --quiet http://hera.physchem.kth.se/~repo/bjodahimgbase/v1.3/pypi/$FNAME -O /tmp/$FNAME; \
    done && \
    for PYPKG in stdeb ; do \
        easy_install-2.7 --always-unzip --allow-hosts=None --find-links file:///tmp/ $PYPKG; \
        easy_install-3.4 --always-unzip --allow-hosts=None --find-links file:///tmp/ $PYPKG; \
    done && \
    rm -r /tmp/*
