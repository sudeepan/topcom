# Base image Stage 1

FROM ubuntu:20.04 as stage1

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y build-essential wget libgmp-dev libcdd-dev m4

WORKDIR /app
COPY . /app

RUN mkdir topcom && cd topcom && mkdir source && \
    mkdir build && cd source && \
    wget https://www.wm.uni-bayreuth.de/de/team/rambau_joerg/TOPCOM-Downloads/TOPCOM-0_17_8.tgz && \
    tar -xzf TOPCOM-0_17_8.tgz && cd topcom-0.17.8 && \
    ./configure --prefix=/app/topcom/build && make && make install && \
    cd ../../ && rm -rf source

# Stage 2

FROM osgeo/gdal:ubuntu-small-latest

# set work directory
WORKDIR /home

COPY --from=stage1 /app/topcom/build/bin/* /usr/local/bin/
COPY --from=stage1 /app/topcom/build/include/* /usr/local/include/
COPY --from=stage1 /app/topcom/build/lib/* /usr/local/lib/
