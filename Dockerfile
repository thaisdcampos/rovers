FROM ruby:3.3.6

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

CMD ["ruby", "app/rover_navigator.rb"]

