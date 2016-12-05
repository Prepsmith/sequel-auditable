class Audit < Sequel::Model
  plugin :json_serializer
  plugin :timestamps, update_on_create: true
  plugin :polymorphic

  many_to_one :resource, polymorphic: true
end
