class ChangeDextarityToDextarity < ActiveRecord::Migration[5.2]
  def change
    rename_column :characters, :dextarity_mod, :dexterity_mod
  end
end
