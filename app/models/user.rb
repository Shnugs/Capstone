class User < ApplicationRecord
  has_many :characters
  has_many :simulations, through: :characters
  has_many :battle_clusters, through: :simulations
  has_many :battles, through: :battle_clusters
end
