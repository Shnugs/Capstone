class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :characters, :dextarity, :dexterity
  end
end
