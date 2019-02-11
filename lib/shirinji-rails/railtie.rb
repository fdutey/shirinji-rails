require 'shirinji'

module ShirinjiRails
  class Railtie < Rails::Railtie
    config.shirinji = ActiveSupport::OrderedOptions.new

    config.shirinji.config_path = nil

    initializer 'shirinji-rails.load_config' do
      init!
    end

    def init!
      return unless (conf = config_path)

      map = eval File.read(conf)
      resolver = Shirinji::Resolver.new(map)

      ActiveSupport::Reloader.to_prepare do
        map = eval File.read(conf)
        resolver.reload(map)
      end

      config.shirinji.resolver = resolver
    end

    private

    def config_path
      ::Rails.application.config.shirinji.config_path ||
      ::Rails.root.join('config/dependencies.rb')
    end
  end
end
