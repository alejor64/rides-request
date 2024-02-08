Sequel.migration do
  change do
    run 'CREATE EXTENSION IF NOT EXISTS "uuid-ossp";'
    create_table(:tokens, id: :uuid, default: Sequel.function(:uuid_generate_v4)) do
      primary_key :id, type: :uuid, default: Sequel.function(:uuid_generate_v4)
      String :token
      foreign_key :user_id, :users, type: :uuid
    end
  end
end