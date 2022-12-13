class Site < ApplicationRecord
  belongs_to :user
  has_many :logs
  has_many :moods
  has_many :seeds
  # geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?
end
