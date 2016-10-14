# Moromi::Apns

[![Latest Version](https://img.shields.io/gem/v/moromi-apns.svg)](http://rubygems.org/gems/moromi-apns)
[![Circle CI](https://circleci.com/gh/moromi/moromi-apns.svg?style=svg)](https://circleci.com/gh/moromi/moromi-apns)

APNS model.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'moromi-apns'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install moromi-apns

## Usage

- initializers/moromi/apns.rb

```ruby
Moromi::Apns.configure do |config|
  config.identifiers = {
    debug: 'com.example.moromi.apns.debug',
    in_house: 'com.example.moromi.apns.in_house',
    production: 'com.example.moromi.apns.production',
  }
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/moromi/moromi-apns.

