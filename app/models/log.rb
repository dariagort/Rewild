class Log < ApplicationRecord
  belongs_to :site
  has_many_attached :photos
end
