class Simulation < ApplicationRecord
  belongs_to :character, optional: true
  has_one :user, through: :characters
  has_many :battle_clusters

end
