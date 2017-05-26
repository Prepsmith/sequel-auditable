module Sequel::Plugins
  module Auditable
    module AddCreatedById
      def insert_sql(*values)
        if values.length == 1 && values.first.is_a?(Hash) && Thread.current[:current_user]
          options = values.first
          options.merge!(created_by_id: Thread.current[:current_user].user_id) if self.columns.include?(:created_by_id)
          options.merge!(updated_by_id: Thread.current[:current_user].user_id) if self.columns.include?(:updated_by_id)
          super(options)
        else
          super
        end
      end

      def multi_insert_sql(columns, values)
        if Thread.current[:current_user]
          if self.columns.include?(:created_by_id)
            columns << :created_by_id
            values.each { |v| v << Thread.current[:current_user].user_id }
          end
          if self.columns.include?(:updated_by_id)
            columns << :updated_by_id
            values.each { |v| v << Thread.current[:current_user].user_id }
          end
          super(columns, values)
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
