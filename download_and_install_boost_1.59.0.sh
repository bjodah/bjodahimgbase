#!/bin/bash -xe
tmpdir=$(mktemp -d)
trap "rm -r $tmpdir" EXIT SIGINT SIGTERM
cd $tmpdir
wget --quiet "http://downloads.sourceforge.net/project/boost/boost/1.59.0/boost_1_59_0.tar.bz2?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fboost%2Ffiles%2Fboost%2F1.59.0%2F&ts=1439991868&use_mirror=kent" -O boost_1_59_0.tar.bz2
echo "6aa9a5c6a4ca1016edd0ed1178e3cb87  boost_1_59_0.tar.bz2" | md5sum -c --
tar xjf boost_1_59_0.tar.bz2
cd boost_1_59_0
echo "using mpi ;">>project-config.jam
./bootstrap.sh
./b2
./b2 install
