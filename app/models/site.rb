class Site < ApplicationRecord
  belongs_to :user
  has_many :logs
  has_many :moods
  # geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?
end
