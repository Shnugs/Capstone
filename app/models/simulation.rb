class Simulation < ApplicationRecord
  belongs_to :character
  has_many :battle_clusters
  
end
