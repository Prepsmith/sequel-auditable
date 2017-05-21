require 'sequel/plugins/auditable/class_methods'
require 'sequel/plugins/auditable/instance_methods'
require 'sequel/plugins/auditable/dataset_action'

module Sequel
  module Plugins
    module Auditable
      def self.configure(model, opts=OPTS)
        model.instance_eval do
          @additional_fields = opts[:additional_fields] || []
        end
        model.set_restricted_columns :created_by_id
      end
    end
  end
end
