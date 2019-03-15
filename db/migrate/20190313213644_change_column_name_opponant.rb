class ChangeColumnNameOpponant < ActiveRecord::Migration[5.2]
  def change
    rename_column :battle_clusters, :opponant_id, :opponent_id
  end
end
