class Log < ApplicationRecord
  belongs_to :site
  has_one :mood
  has_one :seed
  has_many_attached :photos
end
