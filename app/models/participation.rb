class Participation < ApplicationRecord
  belongs_to :event
  belongs_to :circle

  has_one :check
  has_many :errands

  has_many :consignments

  has_many :item_informations

  has_one :webcatalog_information
  has_many :twitter_informations

  has_many :participation_taggings
  has_many :tags, through: :tags

  def placement
    @placement ||= Placement.new(placement_day, placement_block, placement_number, placement_ab)
  end
end
