class Library < ApplicationRecord
  has_many :books
  has_many :map_readers

  validates :name, presence: true
  validates :street_address, presence: true
  validates :city, presence: true
  validates :zip_code, presence: true
end
