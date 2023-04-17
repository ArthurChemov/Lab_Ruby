class Book < ApplicationRecord
  belongs_to :library, optional: true
  has_many :authors
  has_many :genres
end
