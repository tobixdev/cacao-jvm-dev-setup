FROM ubuntu:16.04
MAINTAINER dominik.infuehr@gmail.com

RUN apt-get update \
    && apt-get install -y \
        mercurial \
        wget \
        unzip \
        libtool \
        autoconf \
        automake \
        build-essential \
        gettext \
        binutils-dev \
        libiberty-dev \
        fastjar \
        zlib1g-dev \

        # for add-apt-repository
        software-properties-common

RUN add-apt-repository ppa:openjdk-r/ppa -y \
    && apt-get update \
    && apt-get install -y openjdk-7-jdk

RUN mkdir -p /code/tools
WORKDIR /code

RUN cd tools \
    && wget http://search.maven.org/remotecontent\?filepath\=junit/junit/4.10/junit-4.10.jar \
      -O junit-4.10.jar \
    && mkdir -p /usr/share/java \
    && cp junit-4.10.jar /usr/share/java/junit4.jar

RUN cd tools \
    && wget http://ufpr.dl.sourceforge.net/project/jasmin/jasmin/jasmin-2.4/jasmin-2.4.zip \
    && unzip jasmin-2.4.zip \
    && cp jasmin-2.4/jasmin.jar /usr/share/java/jasmin-sable.jar

RUN cd tools \
    && wget ftp://ftp.gnu.org/gnu/classpath/classpath-0.99.tar.gz \
    && tar xzf classpath-0.99.tar.gz

RUN hg clone https://bitbucket.org/cacaovm/cacao-staging

RUN cd tools/classpath-0.99 \
    && sh autogen.sh \
    && ./configure --disable-plugin --disable-gtk-peer --disable-gconf-peer --disable-gjdoc \
    && make \
    && make install

RUN cd cacao-staging && sh autogen.sh

RUN mkdir build \
    && cd build \
    && ../cacao-staging/configure --enable-disassembler \
    && make \
    && make check