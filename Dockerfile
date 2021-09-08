# This Dockerfile is intended for local development. Since many (most) orgs using speakout have a deployment
# target of Heroku, this Dockerfile uses a Heroku image as a base. At the time of writing, the latest Heroku stack
# is Heroku-20

FROM circleci/ruby:2.7.3-node-browsers

USER root
RUN mkdir /app
WORKDIR /app

# As this is a dev container we are keeping the installation of app
# dependencies (via bundle and yarn), and the mounting of the source
# code external to the container build
#ENV PATH="/usr/local/lib/ruby/gems/bin:${PATH}"
RUN sudo mkdir /bundle
ENV BUNDLE_PATH=/bundle
ENV GEM_HOME=/bundle
RUN bundle config set path '/bundle'

RUN mkdir -p /tmp/sockets

CMD bundle check || bundle install && bundle exec puma -C ./config/puma.rb
