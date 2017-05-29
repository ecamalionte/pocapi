FROM ubuntu:16.04
MAINTAINER Eric Camalionte <ecamalionte>

RUN echo 'deb http://packages.erlang-solutions.com/debian jessie contrib' > /etc/apt/sources.list.d/erlang.list
#RUN wget http://packages.erlang-solutions.com/debian/erlang_solutions.asc
#RUN apt-key add erlang_solutions.asc

# common application dependencies
RUN apt-get update -qq && apt-get install -y --force-yes elixir=1.4.2-1

# nodejs - so we can run brunch on phoenix apps
#RUN echo "deb https://deb.nodesource.com/node_7.x jessie main" > /etc/apt/sources.list.d/node.list
RUN apt-get update && apt-get install -y --force-yes nodejs

# clean up
#RUN rm -rf /var/lib/apt/lists/*

ENV LC_ALL C.UTF-8
ENV MIX_ENV=prod

RUN mkdir pocapi
ADD . /pocapi
WORKDIR /pocapi
VOLUME ./_build/:./_build


RUN mix local.hex --force
RUN mix deps.get
RUN nodejs ./node_modules/brunch/bin/brunch b -p
RUN mix phoenix.digest

ENV POCAPI_PORT=4000
ENV POCAPI_HOST_URL=localhost
ENV SECRET_KEY_BASE=
ENV POCAPI_DATABASE_USERNAME=
ENV POCAPI_DATABASE_PASSWORD=
ENV POCAPI_DATABASE_NAME=pocapi_prod
ENV POCAPI_DATABASE_HOSTNAME=localhost

RUN mix release --env=prod

CMD ["./_build/prod/rel/pocapi/bin/pocapi foreground"]
