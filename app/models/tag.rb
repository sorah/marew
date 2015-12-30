class Tag < ApplicationRecord
  has_many :participation_taggings
  has_many :circle_taggings

  has_many :participations, through: :participation_taggings
  has_many :circles, through: :circle_taggings
end
