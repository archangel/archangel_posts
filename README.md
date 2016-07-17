# ArchangelPosts

Introduction goes here.

## Table of contents

* [Installation](#installation)
* [Updating](#updating)
* [Testing](#testing)
* [Contributing](#contributing)

## Installation

Add to your application's Gemfile

```
gem "archangel_posts", github: "archangel/archangel_posts"
```

Run the bundle command

```
bundle install
```

Run the install generator

```
bundle exec rails g archangel_posts:install
```

If your server was running, restart it to find the assets properly.

## Updating

Subsequent updates can be done by bumping the version in your Gemfile then adding the new migrations

```
bundle exec rails archangel_posts:install:migrations
```

Run migrations

```
bundle exec rails db:migrate
```

## Testing

First, generate a dummy application. You will be required to generate a dummy application before running tests.

```
bundle exec rake dummy_app
```

Run tests

```
bundle exec rake
```

or

```
bundle exec rake spec
```

or

```
bundle exec rspec spec
```

When testing your applications integration with this extension you may use it's factories. Simply add this require statement to your spec_helper:

```
require "archangel_posts/factories"
```

## Contributing

1. Fork it ( https://github.com/archangel/archangel_posts/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
