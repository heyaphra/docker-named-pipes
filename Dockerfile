FROM ubuntu:18.04

# Define a volume for mounting the host pipe
VOLUME /host_pipe

# Install the basics
RUN apt-get update -qq && apt-get install -qqy \
    apt-transport-https\
    ca-certificates \
    curl 

# Install Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-update -qq && apt install -qqy --no-install-recommends install yarn

# Install NVM
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
RUN nvm i stable

# Install the NodeJS app in the container
WORKDIR /usr/src/app

COPY package.json ./
RUN yarn
COPY . .

CMD ["yarn", "start"]