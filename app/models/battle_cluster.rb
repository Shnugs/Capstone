class BattleCluster < ApplicationRecord
  belongs_to :simulation, optional: true
  has_many :battles 
  has_one :opponent

end
