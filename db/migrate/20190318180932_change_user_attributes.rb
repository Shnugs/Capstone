class ChangeUserAttributes < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :password, :password_digest
    add_column :users, :name, :string
  end
end
