# Shirinji-Rails

Integration of [Shirinji](https://github.com/fdutey/shirinji) in rails

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'shirinji-rails'
```

And then execute:

    $ bundle

## Usage

Add this file in `config/dependencies.rb`

```ruby
Shirinji::Map.new do
  # declare your dependencies here
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/fdutey/shirinji-rails.
