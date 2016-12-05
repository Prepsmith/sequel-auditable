module Sequel::Plugins
  module Auditable
    module ClassMethods
      attr_reader :additional_fields

      Sequel::Plugins.inherited_instance_variables(self, :@additional_fields => [])
    end
  end
end
