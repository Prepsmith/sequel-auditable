# Sequel::Auditable

sequel auditable

## Installation

```ruby
gem 'sequel_polymorphic'
gem 'sequel-auditable', github: 'Prepsmith/sequel-auditable'
```

And then execute:

    $ bundle

## Usage

Copy `models/audit.rb` to your project.

Copy `migrations/create_audits` to your project and run migration.

Add `pg_json` extension.

```
DB.extension(:pg_json)
```

Enable instance_hooks plugin and auditable plugin in your models.

```
plugin :instance_hooks
plugin :auditable

# plugin :auditable additional_fields: %i(state owner)
```

Also make sure `Thread[:current_user]` (user in eic-auth) exists in every request.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/sequel-auditable.

