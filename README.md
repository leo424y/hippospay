# Hippospay

This gem help you to use [生活圈商户开放平台](https://fubei.gitbooks.io/lifecircleopen-api/content/)

- get [对账单](https://fubei.gitbooks.io/lifecircleopen-api/content/business/methods/orderReconciliation.html) by date

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hippospay'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hippospay

## Usage

require 'hippospay'
extend Hippospay

```
ENV['hippo_app_id'] = YOURAPPID
ENV['hippo_app_secret'] = YOURAPPSECRET
get_hippo(day: "9", month: "11", year: "2017")
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/leo424y/hippospay. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Hippospay project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/leo424y/hippospay/blob/master/CODE_OF_CONDUCT.md).
