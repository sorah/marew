class Circle < ApplicationRecord
  has_many :participations
  has_many :events, through: :participations

  has_many :consignments
  has_many :consigned_events, through: :consignments, source: :event

  has_many :circle_taggings
  has_many :tags, through: :circle_taggings
end
