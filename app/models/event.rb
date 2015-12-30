class Event < ApplicationRecord
  has_many :participations
  has_many :circles, through: :participations

  has_many :checks, through: :participations
  has_many :errands, through: :participations
end
