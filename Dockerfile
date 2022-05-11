FROM ruby:3.0.0
RUN apt update -qq && apt install -y nodejs postgresql-client
WORKDIR /app
COPY . /app/
COPY Gemfile ./Gemfile
COPY Gemfile.lock ./Gemfile.lock
RUN bundler install

# COPY entrypoint.sh /usr/bin/
ENTRYPOINT ["bin/rails"]
CMD ["s", "-b", "0.0.0.0"]
EXPOSE 3000
