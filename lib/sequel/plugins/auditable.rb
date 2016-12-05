require 'sequel/plugins/auditable/class_methods'
require 'sequel/plugins/auditable/instance_methods'

module Sequel
  module Plugins
    module Auditable
      def self.configure(model, opts=OPTS)
        model.instance_eval do
          @additional_fields = opts[:additional_fields] || []
        end
      end
    end
  end
end