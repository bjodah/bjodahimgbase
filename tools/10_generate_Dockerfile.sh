#!/bin/bash -e
# Remember to first run:
#    $ ./tools/download_python_packages.sh

# Extract absolute path of dir above script, from:
# http://unix.stackexchange.com/a/9546
absolute_repo_path_x="$(readlink -fn -- "$(dirname $0)/.."; echo x)"
absolute_repo_path="${absolute_repo_path_x%x}"

cd "$absolute_repo_path"

APT_PACKAGES=$(cat ./environment/resources/apt_packages.txt)
APT_PACKAGES_LLVM=$(cat ./environment/resources/apt_packages_llvm.txt)
cat <<EOF >environment/Dockerfile
# DO NOT EDIT, This Dockerfile is generated from ./tools/10_generate_Dockerfile.sh
FROM ubuntu:14.04.3
MAINTAINER Björn Dahlgren <bjodah@DELETEMEgmail.com>
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV DEBIAN_FRONTEND noninteractive
RUN locale-gen en_US.UTF-8 && \\
    echo "path-exclude /usr/share/doc/*" >/etc/dpkg/dpkg.cfg.d/01_nodoc && \\
    echo "path-include /usr/share/doc/*/copyright" >>/etc/dpkg/dpkg.cfg.d/01_nodoc && \\
    apt-get update && \\
    apt-get --quiet --assume-yes install \\
${APT_PACKAGES}
    wget -O - http://llvm.org/apt/llvm-snapshot.gpg.key|sudo apt-key add - && \\
    echo "\n\
deb http://llvm.org/apt/trusty/ llvm-toolchain-trusty-3.7 main \n\
deb-src http://llvm.org/apt/trusty/ llvm-toolchain-trusty-3.7 main \n\
    " >> /etc/apt/sources.list.d/llvm.list && \\
    apt-get update && \\
    apt-get --quiet --assume-yes install \\
${APT_PACKAGES_LLVM}
    apt-get clean && \\
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
EOF
