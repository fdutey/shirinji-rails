
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "shirinji-rails/version"

Gem::Specification.new do |spec|
  spec.name          = 'shirinji-rails'
  spec.version       = ShirinjiRails::VERSION
  spec.authors       = ['Florian Dutey']
  spec.email         = ['fdutey@gmail.com']

  spec.summary       = %q{Shirinji integration for rails}
  spec.description   = %q{Shirinji integration for rails (see https://github.com/fdutey/shirinji for more details)}
  spec.homepage      = 'https://github.com/fdutey/shirinji-rails'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'railties', '>= 5.0.0'
  spec.add_dependency 'shirinji', '>= 0.0.3'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
