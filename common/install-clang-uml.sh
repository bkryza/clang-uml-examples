#!/bin/bash

add-apt-repository ppa:bkryza/clang-uml -y
apt update
apt -y install clang-uml=$1-0ubuntu1ppa1~oracular
apt clean