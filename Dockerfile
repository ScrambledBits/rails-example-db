FROM ruby:3.3.3-bookworm

RUN apt-get update && apt-get install -y postgresql-client nodejs

WORKDIR /blog

COPY blog/Gemfile /blog/Gemfile
COPY blog/Gemfile.lock /blog/Gemfile.lock

RUN bundle install

COPY ./blog/ /blog/
COPY entrypoint.sh /entrypoint.sh

RUN SECRET_KEY_BASE_DUMMY=1 ./bin/rails assets:precompile

EXPOSE 3000

ENTRYPOINT [ "/entrypoint.sh" ]

CMD [ "bundle", "exec", "rails", "server", "-b", "0.0.0.0" ]
