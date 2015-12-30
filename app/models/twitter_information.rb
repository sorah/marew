class TwitterInformation < ApplicationRecord
  belongs_to :participation
  belongs_to :event

  def placement
    @placement ||= Placement.new(placement_day, placement_block, placement_number, placement_ab)
  end
end
