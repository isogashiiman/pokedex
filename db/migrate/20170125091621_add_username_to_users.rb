class AddUsernameToUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users
    add_column :users, :username, :string
    add_index :users, :username, unique: true
  end
end
