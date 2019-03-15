class ChangeColumnNameClusterId < ActiveRecord::Migration[5.2]
  def change
    rename_column :battles, :cluster_id, :battle_clusters_id
  end
end
