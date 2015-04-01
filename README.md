# SchemaPlus Association Inverses [![Build Status](https://travis-ci.org/lowjoel/schema_plus_association_inverses.svg)](https://travis-ci.org/lowjoel/schema_plus_association_inverses)

This little gem detects when an ActiveRecord association requires the programmer to explicitly set
`inverse_of` in the declaration.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'schema_plus_association_inverses'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install schema_plus_association_inverses

## Usage

When a model requiring manual declaration of the inverse is detected, a little window appears at the
bottom of the page. This is inspired by [Bullet](https://github.com/flyerhzm/bullet).

## Contributing

1. Fork it (https://github.com/lowjoel/schema_plus_association_inverses/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
