FROM ruby:3.1.4

RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  yarn

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install

COPY . .

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3000"]
