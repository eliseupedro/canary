FROM ubuntu:22.04
ENV DEBIAN_FRONTEND noninteractive
RUN apt update -y 
RUN apt upgrade -y 
RUN apt dist-upgrade
RUN apt-get update
RUN apt-get install git-all -y --fix-missing
RUN apt-get install git cmake build-essential liblua5.2-dev libgmp3-dev libmysqlclient-dev libboost-system-dev libboost-iostreams-dev libboost-filesystem-dev libpugixml-dev libcrypto++-dev libfmt-dev -y
RUN apt install git cmake build-essential autoconf libtool ca-certificates curl zip unzip tar pkg-config ninja-build ccache linux-headers-5.15.0-88-generic -y
RUN git clone https://github.com/microsoft/vcpkg && cd vcpkg && ./bootstrap-vcpkg.sh && cd ..
RUN git clone --recursive https://github.com/eliseupedro/canary.git
WORKDIR /canary
RUN mkdir build
WORKDIR /canary/build
RUN cmake -DCMAKE_TOOLCHAIN_FILE=/vcpkg/scripts/buildsystems/vcpkg.cmake .. --preset linux-release
RUN cmake --build linux-release
RUN cp /canary/build/linux-release/bin/canary /canary/canary
RUN cp /canary/build/linux-release/bin/canary /bin/canary
WORKDIR /canary
VOLUME /canary
ENTRYPOINT ["/canary/canary"]
