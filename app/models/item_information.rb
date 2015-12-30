class ItemInformation < ApplicationRecord
  belongs_to :participation
  has_many :errands
end
