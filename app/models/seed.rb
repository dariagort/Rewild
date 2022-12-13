class Seed < ApplicationRecord
  belongs_to :site
  has_many :logs
  has_many :moods, through: :logs
end
