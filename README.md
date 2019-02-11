# Shirinji-Rails

Integration of [Shirinji](https://github.com/fdutey/shirinji) in rails

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'shirinji-rails'
```

And then execute:

    $ bundle

## General usage

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

## Rails entities DSL

Since controllers and jobs (and maybe other rails entities) are not under 
Shirinji's control, they can not receive dependencies through their constructors.

One solution is to manually create a method for each dependency but it's painful 
and make the code harder to read. 

Rails integration actually provides a simple DSL to express dependencies.

```ruby
# application_controller.rb

class ApplicationController < ActionController::Base 
  include ShirinjiRails::ResolverBinding
end

# in any controller

class FooController < ApplicationController
  dependency :config
  # Alias
  dependency foo_create_service: :create_service
  
  def index
    config #=> `config` dependency
    create_service # => `foo_create_service` dependency 
  end
end

class FooJob < ActiveJob::Base
  include ShirinjiRails::ResolverBinding

  dependency :config
 
  def perform
    config #=> `config` dependency
  end
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/fdutey/shirinji-rails.
