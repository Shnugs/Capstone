class ChangeColumnDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default :battles, :dmg_taken, 0
    change_column_default :battles, :dmg_dealt, 0
    change_column_default :battles, :turns, 0
    change_column_default :battles, :hits, 0
    change_column_default :battles, :misses, 0
    change_column_default :battles, :crits, 0
    change_column_default :battles, :atk_1_rate, 0.0
    change_column_default :battles, :atk_2_rate, 0.0
    change_column_default :battles, :atk_3_rate, 0.0
  end
end
