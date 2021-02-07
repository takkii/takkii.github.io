# distro os.
FROM ubuntu:bionic
# mkdir users
LABEL maintainer="Takayuki Kamiyama <karuma.reason@gmail.com>"
# build package
RUN apt-get update && apt-get install -y \ 
git rbenv ruby-build ruby-dev sqlite3 libxslt1-dev libxml2-dev build-essential patch \
libsqlite3-dev libcurl4-openssl-dev curl nodejs && apt-get clean

# locale
RUN apt install -y language-pack-ja
RUN update-locale LANG=ja_JP.UTF-8
RUN echo 'eval "LANG=ja_JP.UTF-8"' >> ~/.bashrc
RUN echo 'eval "export LANG"' >> ~/.bashrc

# rbenv
RUN git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build

RUN rbenv install -l
RUN rbenv install 2.7.2

RUN echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
RUN echo 'eval "$(rbenv init -)"' >> ~/.bashrc
ENV RUBYOPT -EUTF-8
RUN rbenv init -
RUN rbenv global 2.7.2
RUN rbenv rehash

FROM ruby:2.7
RUN echo 'export RUBYOPT='-W:no-deprecated -W:no-experimental'' >> ~/.bashrc

# install
RUN git clone https://github.com/takkii/takkii.github.io.git
WORKDIR /takkii.github.io
COPY . /takkii.github.io
RUN bundle update

EXPOSE 4000

# All Docker remove command. Clean up all.
# docker system prune
