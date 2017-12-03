# `rails dep:upgrade`

Keep your Rails app dependencies up-to-date by running `rails dep:upgrade` weekly.

`rails dep:upgrade` runs `bundle update`, `bundle audit`, `yarn upgrade` to update your app dependencies,
then generates a markdown summary for your pull/merge request:

```markdown
Paste this summary into your pull/merge request (chore-dep_upgrade_20171202):
-----

## Dep Upgrade 2017-12-02

bundle update:
* airbrake-ruby [(2.6.0 -> 2.6.1)](https://gemnasium.com/gems/airbrake-ruby)
* inherited_resources [(1.7.2 -> 1.8.0)](https://gemnasium.com/gems/inherited_resources)
* paper_trail [(8.0.1 -> 8.1.0)](https://gemnasium.com/gems/paper_trail)
* twilio-ruby [(5.5.0 -> 5.5.1)](https://gemnasium.com/gems/twilio-ruby)
* uglifier [(3.2.0 -> 4.0.0)](https://gemnasium.com/gems/uglifier)

bundle audit:
No vulnerabilities found

yarn upgrade:
* moment (2.19.2 -> 2.19.3)
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem "dep_upgrade"
```

And then execute:

```
$ bundle
```

After that, rake task `dep:upgrade` will be added automatically into your Rails app.

## Usage

Run:

```
$ rails dep:upgrade
```



## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/blacktangent/dep_upgrade. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the DepUpgrade project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/dep_upgrade/blob/master/CODE_OF_CONDUCT.md).
