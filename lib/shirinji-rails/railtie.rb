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
      config.shirinji.resolver = Shirinji::Resolver.new(map)

      ActiveSupport::Reloader.to_prepare do
        map = eval File.read(conf)
        ::Rails.application.config.shirinji.resolver.reload(map)
      end
    end

    private

    def config_path
      ::Rails.application.config.shirinji.config_path ||
      ::Rails.root.join('config/dependencies.rb')
    end
  end
end
