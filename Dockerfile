FROM ruby:2.7.0-alpine
RUN apk add --no-cache --update build-base gmp-dev tzdata
RUN gem update --system && \
    gem install bundler -v 2.1.4
WORKDIR /app
COPY . ./
RUN bundle check || bundle install
CMD ["rails", "server", "-b", "0.0.0.0"]
