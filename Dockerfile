FROM ubuntu:bionic

ENV DEBIAN_FRONTEND=noninteractive

# Update repository and install basic dependencies
RUN apt-get update && apt-get install -y \
    wget \
    git \
    unzip \
    sudo \
    curl \
    software-properties-common

# Install latest php
RUN LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php \
    && apt-get update \
    && apt-get install -y php7.4 \
    php7.4-xml \
    php7.4-gd \
    php7.4-pgsql \
    php7.4-mbstring \
    php7.4-redis \
    php7.4-curl \
    php7.4-zip \
    && curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer

# Install Java
RUN apt-get install -y default-jre

RUN sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 7FCC7D46ACCC4CF8

# Install Postgres
RUN add-apt-repository "deb http://apt.postgresql.org/pub/repos/apt/ bionic-pgdg main" \
    && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add - \
    && apt-get update \
    && apt-get install -y postgresql-10

# Install Redis
RUN  apt-get install -y redis-server

# Install nodejs
RUN curl -sL https://deb.nodesource.com/setup_13.x | sudo bash -
RUN apt-get install -y nodejs
