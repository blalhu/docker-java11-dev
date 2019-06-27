FROM debian:stable

RUN mkdir /usr/java

RUN apt-get update \
    && apt-get install -y curl

RUN    cd /usr/java \
    && curl "https://download.java.net/java/GA/jdk11/9/GPL/openjdk-11.0.2_linux-x64_bin.tar.gz" --output openjdk-11.0.2_linux-x64_bin.tar.gz \
    && tar -zxvf openjdk-11.0.2_linux-x64_bin.tar.gz \
    && rm openjdk-11.0.2_linux-x64_bin.tar.gz

ENV PATH="/usr/java/jdk-11.0.2/bin:${PATH}"

RUN apt-get update \
    && apt-get install -y curl \
    && apt-get install -y zip \
    && apt-get install -y unzip \
    && curl -s "https://get.sdkman.io" | bash \
    && chmod 744 /root/.sdkman/bin/sdkman-init.sh \
    && /root/.sdkman/bin/sdkman-init.sh

ENV PATH="${PATH}:/root/.sdkman/bin/"

RUN yes | /bin/bash -l -c 'sdk install gradle && sdk install maven'

