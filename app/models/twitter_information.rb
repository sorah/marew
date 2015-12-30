class TwitterInformation < ApplicationRecord
  belongs_to :participation
  belongs_to :event
end
