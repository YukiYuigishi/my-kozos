FROM ubuntu:16.04

LABEL version="1.0"
LABEL description="Kozos のビルド環境"

RUN apt-get update \
   apt-get upgrade -y\
   apt-get install curl gcc make 

RUN cd /tmp\
   wget http://kozos.jp/books/makeos/binutils-2.19.1.tar.gz  \
   tar xvf /tmp/binutils-2.19.tar.gz\
   cd /tmp/binutils-2.19\
   ./configure --target=h8300-elf --disable-nls \
   make -j7 \
   make install


RUN cd /tmp\
   wget http://kozos.jp/books/makeos/gcc-3.4.6.tar.gz  \
   tar xvf /tmp/gcc-3.4.6.tar.gz \
   cd /tmp/gcc-3.4.6 \
   setenv SHELL /usr/local/bin/bash\
   ./configure --target=h8300-elf --disable-nls --disable-threads --disable-shared --enable-languages=c\
   make -j7\
   make install

