class AddClusteridToBattle < ActiveRecord::Migration[5.2]
  def change
    add_column :battles, :cluster_id, :integer
  end
end
