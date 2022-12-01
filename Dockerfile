FROM ruby:latest

LABEL maintainer="nathan@sxnlabs.com"

RUN apt-get update -yqq && apt-get install --no-install-recommends \
  apt-transport-https

RUN curl -sL https://deb.nodesource.com/setup_19.x | bash -

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | \
  tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends \ 
  nodejs \
  yarn

RUN gem update --system
RUN gem update bundler

COPY Gemfile* /usr/src/app/
WORKDIR /usr/src/app
ENV BUNDLE_PATH /gems
RUN bundle install

COPY package.json /usr/src/app/
COPY yarn.lock /usr/src/app/
RUN yarn install

COPY . /usr/src/app/

ENTRYPOINT ["./docker-entrypoint.sh"]

CMD ["bin/rails", "s", "-b", "0.0.0.0"]