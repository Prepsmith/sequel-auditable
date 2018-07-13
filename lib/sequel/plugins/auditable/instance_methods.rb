module Sequel::Plugins
  module Auditable
    module InstanceMethods
      def after_save
        super
        if primary_key == :id
          fields = model.additional_fields.inject({}) { |hash, field| hash[field] = self.send(field); hash }
          Audit.create(user_id: current_user_id, user_name: current_user_name, resource: self, fields: Sequel.pg_json(fields)) unless fields.empty?
        end
      end

      def current_user_id
        Thread.current[:current_user] ? Thread.current[:current_user].user_id : ''
      end

      def current_user_name
        Thread.current[:current_user] ? Thread.current[:current_user].username : ''
      end
    end
  end
end
