//clean database
rails db:drop db:create db:migrate

//migrate
rails db:migrate

//generate create table
rails generate migration create_table

//generate foreign key
rails generate add_user_id_to_documents
-> add_column :documents, :user_id, :integer

//generate
rails g controller addresses --skip-assets --no-helper 