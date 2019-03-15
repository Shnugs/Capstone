class ChangeColumnNameBattleClustersId < ActiveRecord::Migration[5.2]
  def change
    rename_column :battles, :battle_clusters_id, :battle_cluster_id
  end
end
