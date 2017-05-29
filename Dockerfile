FROM ubuntu:16.04
MAINTAINER Eric Camalionte <ecamalionte>

# add erlang source list
RUN echo 'deb http://packages.erlang-solutions.com/debian jessie contrib' > /etc/apt/sources.list.d/erlang.list

# install elixir/earlang dependencies
RUN apt-get update -qq && apt-get install -y --force-yes elixir=1.4.2-1

# install nodejs - so we can run brunch on phoenix apps
RUN apt-get update && apt-get install -y --force-yes nodejs

# inject ENV var
ENV LC_ALL C.UTF-8
ENV MIX_ENV=prod

# copy source code to container
RUN mkdir pocapi
ADD . /pocapi
WORKDIR /pocapi

# get all dependencies and prepare assets
RUN mix local.hex --force
RUN mix deps.get
RUN nodejs ./node_modules/brunch/bin/brunch b -p
RUN mix phoenix.digest
RUN mix local.hex --force

# inject ENV vars to configure the ecosystem
ENV POCAPI_PORT=4001
ENV POCAPI_HOST_URL=localhost
ENV SECRET_KEY_BASE=SicwdzM6BcUnea9wsUSCngtCix+ECUCX+arAEbexNsQBC47DKZWLpqX8s4xwJV7z
ENV POCAPI_DATABASE_USERNAME=postgres
ENV POCAPI_DATABASE_PASSWORD=
ENV POCAPI_DATABASE_NAME=pocapi_prod
ENV POCAPI_DATABASE_HOSTNAME=postgres_db

# compile and generate production package
RUN mix release --env=prod

# make this container act like a CI pushing packages to production env.
#ADD ./ssh/MyKeyPair.pem .
#RUN scp -i MyKeyPair.pem ./_build/prod/rel/pocapi/ user@instance.compute.amazonaws.com:~\

CMD ["/bin/bash"]

