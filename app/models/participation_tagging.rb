class ParticipationTagging < ApplicationRecord
  belongs_to :participation
  belongs_to :tag
end
