Sequel.migration {
  change do
    create_table :audits do
      primary_key :id
      Integer :resource_id
      String :resource_type
      String :user_id
      String :user_name
      DateTime :created_at
      DateTime :updated_at
      jsonb :fields
      index [:resource_id, :resource_type]
    end
  end
}
