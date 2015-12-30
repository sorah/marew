class Consignment < ApplicationRecord
  belongs_to :circle
  belongs_to :participation

  has_many :item_information
end
