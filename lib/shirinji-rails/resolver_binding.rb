module ShirinjiRails
  module ResolverBinding
    extend ActiveSupport::Concern

    module ClassMethods
      def dependency(*deps)
        deps.each { |dep| _define_dependency_reader(dep) }
      end

      def _define_dependency_reader(bean, method = bean)
        if bean.is_a?(Hash)
          return bean.each { |k,v| _define_dependency_reader(k, v) }
        end

        define_method(method) do
          resolver.resolve(bean)
        end
      end
    end

    def resolver
      ::Rails.application.config.shirinji.resolver
    end
  end
end
