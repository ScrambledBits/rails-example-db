FROM ruby:3.3.3-bookworm

RUN apt-get update && apt-get install -y postgresql-client nodejs

WORKDIR /app

COPY blog/Gemfile /app/Gemfile
COPY blog/Gemfile.lock /app/Gemfile.lock

RUN bundle install

COPY blog/ /app/
COPY entrypoint.sh /entrypoint.sh

RUN SECRET_KEY_BASE_DUMMY=1 ./bin/rails assets:precompile

EXPOSE 3000

ENTRYPOINT [ "/entrypoint.sh" ]

CMD [ "bundle", "exec", "rails", "server", "-b", "0.0.0.0" ]
