FROM trenpixster/elixir
ENV VERSION 0.0.2
ENV APP_HOST 8080
ENV MIV_ENV prod
EXPOSE $APP_HOST
RUN mkdir /app
COPY . /app
WORKDIR /app
RUN MIX_ENV=prod mix do deps.get, compile
RUN MIX_ENV=prod mix phoenix.digest
RUN MIX_ENV=prod mix compile
RUN MIX_ENV=prod mix release
WORKDIR /app/rel/gaetest/releases/$VERSION
ENTRYPOINT ["./gaetest.sh"]
CMD ["foreground"]
