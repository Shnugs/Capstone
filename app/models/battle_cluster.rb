class BattleCluster < ApplicationRecord
  belongs_to :simulation
  has_many :battles 
  
end
