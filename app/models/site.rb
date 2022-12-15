class Site < ApplicationRecord
  belongs_to :user
  has_many :logs, dependent: :destroy
  has_many :moods, dependent: :destroy
  has_many :seeds, dependent: :destroy
  # geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?
end
