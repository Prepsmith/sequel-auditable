module Sequel::Plugins
  module Auditable
    module InstanceMethods
      def created_by
        first_audit = Audit.where(resource_id: self.id, resource_type: self.class.name).order(:created_at).first
        if first_audit
          { id: first_audit.user_id, name: first_audit.user_name }
        else
          {}
        end
      end

      def updated_by
        last_audit = Audit.where(resource_id: self.id, resource_type: self.class.name).order(:created_at).last
        if last_audit
          { id: last_audit.user_id, name: last_audit.user_name }
        else
          {}
        end
      end

      def before_create
        super
        self.created_by = current_user_id if self.respond_to? :created_by=
      end

      def after_save
        super
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
