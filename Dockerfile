FROM ruby:2.6

# Installation of dependencies
RUN apt-get update -qq \
    && apt-get install -y \
        # Needed for certain gems
    build-essential \
        # Needed for postgres gem
    libpq-dev \
    # The following are used to trim down the size of the image by removing unneeded data
    && apt-get clean autoclean \
    && apt-get autoremove -y \
    && rm -rf \
    /var/lib/apt \
    /var/lib/dpkg \
    /var/lib/cache \
    /var/lib/log
# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .
# current directory to /user/src/app

EXPOSE 3000
# Add metadata to the image to describe which port the container is listening on at runtime.
CMD RAILS_ENV=${RAILS_ENV} bundle exec rails db:create db:migrate db:seed && bundle exec rails s -p ${PORT} -b '0.0.0.0'
