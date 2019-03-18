class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true

  has_many :characters
  has_many :simulations, through: :characters
  has_many :battle_clusters, through: :simulations
  has_many :battles, through: :battle_clusters
end
