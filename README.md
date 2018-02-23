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

Dependency resolver can be accessed through

```ruby
Rails.application.config.shirinji.resolver
```

I suggest to use a helper to make your life easier. 

```ruby
# lib/my_app.rb

module MyApp
  module_function
  
  def bean(name)
    ::Rails.application.config.shirinji.resolver.resolve(name)
  end
end

# moments later, in controllers / job / rake tasks
service = MyApp.bean(:user_sign_up_service)
service.call(user) 
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/fdutey/shirinji-rails.
