FROM ubuntu:16.04

RUN  apt-get install -y \
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
        software-properties-common

RUN apt update \
    && apt-get install -y software-properties-common \
    && add-apt-repository ppa:ubuntu-toolchain-r/test \
    && apt update \
    && apt install gcc-9 g++-9 -y \
    && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 90 --slave /usr/bin/g++ g++ /usr/bin/g++-9 --slave /usr/bin/gcov gcov /usr/bin/gcov-9 \\
    && update-alternatives --config gcc

RUN add-apt-repository ppa:openjdk-r/ppa -y \
    && apt-get update \
    && apt-get install -y openjdk-7-jdk

RUN mkdir -p /code/tools
WORKDIR /code

RUN cd tools \
    && wget https://repo1.maven.org/maven2/junit/junit/4.12/junit-4.12.jar -O junit-4.12.jar \
    && mkdir -p /usr/share/java \
    && cp junit-4.12.jar /usr/share/java/junit4.jar

RUN cd tools \
    && wget https://repo1.maven.org/maven2/org/hamcrest/hamcrest-all/1.3/hamcrest-all-1.3.jar -O hamcrest-1.3.jar \
    && cp hamcrest-1.3.jar /usr/share/java/hamcrest.jar

RUN cd tools \
    && wget http://ufpr.dl.sourceforge.net/project/jasmin/jasmin/jasmin-2.4/jasmin-2.4.zip \
    && unzip jasmin-2.4.zip \
    && cp jasmin-2.4/jasmin.jar /usr/share/java/jasmin-sable.jar

RUN cd tools \
    && wget ftp://ftp.gnu.org/gnu/classpath/classpath-0.99.tar.gz \
    && tar xzf classpath-0.99.tar.gz

RUN cd tools \
    && wget https://sourceforge.net/projects/boost/files/boost/1.61.0/boost_1_61_0.tar.gz \
    && tar xzf boost_1_61_0.tar.gz

RUN hg clone https://bitbucket.org/tobixdev/cacao-staging/

RUN cd tools/classpath-0.99 \
    && sh autogen.sh \
    && ./configure --disable-plugin --disable-gtk-peer --disable-gconf-peer --disable-gjdoc \
    && make \
    && make install

RUN cd cacao-staging && sh autogen.sh

RUN mkdir build \
    && cd build \
    && ../cacao-staging/configure --enable-debug --enable-compiler2 --enable-replacement --enable-logging --with-java-runtime-library=gnuclasspath --with-java-runtime-library-prefix=/usr/local/classpath --with-junit-jar=/usr/share/java/junit4.jar:/usr/share/java/hamcrest.jar

ENV CPATH=/code/tools/boost_1_61_0/