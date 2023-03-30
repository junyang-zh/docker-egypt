FROM perl:latest

# install egypt
ADD http://www.gson.org/egypt/download/egypt-1.11.tar.gz .
RUN tar -xvf egypt-1.11.tar.gz  && \
    cd egypt-1.11 && \
    perl Makefile.PL && \
    make && make install

# install build environment and graphviz
RUN apt update && apt install -y bash build-essential graphviz

# clean up
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["/bin/bash"]
