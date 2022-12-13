class Seed < ApplicationRecord
  belongs_to :site
  has_many :logs, through: :tags
  has_many :moods, through: :tags
end
