class Mood < ApplicationRecord
  belongs_to :site
  has_many :tags
  has_many :logs, through: :tags
end
