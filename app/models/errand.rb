class Errand < ApplicationRecord
  belongs_to :participation
  has_one :item_information
end
