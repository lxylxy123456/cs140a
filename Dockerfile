# 
# cs140a - Docker environment for ECS140A
# Copyright (C) 2020  lxylxy123456
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
# 
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
# 

# Install Go 1.11.4
FROM golang:1.11.4-stretch
LABEL maintainer="ercli@ucdavis.edu"

# Install Common Lisp 2.49
# Install SWI-Prolog 7.6.4
# apt-get first line: clisp
# apt-get second line: some useful tools
# apt-get other lines: prerequisits for building swipl
RUN apt-get update; \
    apt-get install -y \
            clisp \
            vim nano tmux screen gawk less python3 zip \
            build-essential cmake ninja-build pkg-config \
            ncurses-dev libreadline-dev libedit-dev \
            libgoogle-perftools-dev \
            libunwind-dev \
            libgmp-dev \
            libssl-dev \
            unixodbc-dev \
            zlib1g-dev libarchive-dev \
            libossp-uuid-dev \
            libxext-dev libice-dev libjpeg-dev libxinerama-dev libxft-dev \
            libxpm-dev libxt-dev \
            libdb-dev \
            libpcre3-dev \
            libyaml-dev \
            default-jdk junit; \
    apt-get clean; \
    curl https://www.swi-prolog.org/download/stable/src/swipl-7.6.4.tar.gz | \
        tar -zxf -; \
    cd swipl-7.6.4; \
    ./configure; \
    make; \
    make install; \
    cd packages; \
    ./configure; \
    make; \
    make install; \
    cd ../..; \
    rm -rf swipl-7.6.4; \
    ln -s /usr/local/bin/swipl /usr/bin/swipl

