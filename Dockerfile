FROM ubuntu:18.04

SHELL ["/bin/bash", "-c"] 

ENV NODE_VERSION stable
ENV NVM_DIR /root/.nvm

# Define a volume for mounting the host pipe
VOLUME /host-pipe

# Install the basics
RUN apt-get update -qq && apt-get install -qqy \
    apt-transport-https\
    ca-certificates \
    curl \
    gnupg2

# Install NVM
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
RUN source ${NVM_DIR}/nvm.sh && nvm i ${NODE_VERSION} && nvm alias default ${NODE_VERSION} && nvm use default

# Install Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -qqy --no-install-recommends yarn

# Install the NodeJS app in the container
WORKDIR /usr/src/app

COPY ./dockerized-app .

CMD [ "bash" ]