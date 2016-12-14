module Sequel::Plugins
  module Auditable
    module InstanceMethods
      def before_create
        super
        self.created_by = current_user_id if self.respond_to? :created_by=
      end

      def after_save
        super
        self.updated_by = current_user_id if self.respond_to? :updated_by=
        fields = model.additional_fields.inject({}) { |hash, field| hash[field] = self.send(field); hash }
        Audit.create(user_id: current_user_id, user_name: current_user_name, resource: self, fields: Sequel.pg_json(fields))
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
