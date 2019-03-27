class AddProfileUrlToCharacter < ActiveRecord::Migration[5.2]
  def change
    add_column :characters, :profile_url, :string
  end
end
