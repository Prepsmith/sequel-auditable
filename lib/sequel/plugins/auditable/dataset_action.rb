module Sequel::Plugins
  module Auditable
    module AddCreatedById
      def insert_sql(*values)
        if self.columns.include?(:created_by_id) && values.length == 1 && values.first.is_a?(Hash) && Thread.current[:current_user]
          super(values.first.merge(created_by_id: Thread.current[:current_user].user_id))
        else
          super
        end
      end
    end

    module AddUpdatedById
      def update_sql(values = OPTS)
        if self.columns.include?(:updated_by_id) && values.is_a?(Hash) && Thread.current[:current_user]
          super(values.merge(updated_by_id: Thread.current[:current_user].user_id))
        else
          super
        end
      end
    end
  end
end

class Sequel::Dataset
  prepend Sequel::Plugins::Auditable::AddCreatedById
  prepend Sequel::Plugins::Auditable::AddUpdatedById
end
