# This Dockerfile uses a circleci image for convenience.

FROM circleci/ruby:3.0.0-node-browsers

USER root
RUN mkdir /app
WORKDIR /app

# As this is a dev container we are keeping the installation of app
# dependencies (via bundle and yarn), and the mounting of the source
# code external to the container build
#ENV PATH="/usr/local/lib/ruby/gems/bin:${PATH}"
RUN mkdir /bundle
ENV BUNDLE_PATH=/bundle
ENV GEM_HOME=/bundle
RUN bundle config set path '/bundle'

RUN mkdir -p /tmp/sockets

CMD bundle check || bundle install && bundle exec puma -C ./config/puma.rb
