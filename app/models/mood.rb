class Mood < ApplicationRecord
  belongs_to :site
  has_many :logs
  has_many :seeds, through: :logs
end
