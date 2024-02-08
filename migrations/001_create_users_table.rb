Sequel.migration do
  change do
    run 'CREATE EXTENSION IF NOT EXISTS "uuid-ossp";'
    create_table(:users, id: :uuid, default: Sequel.function(:uuid_generate_v4)) do
      primary_key :id, type: :uuid, default: Sequel.function(:uuid_generate_v4)
      String :firstname
      String :lastname
      String :email
      String :phone
      String :nickname
      String :age
      String :gender
    end
  end
end