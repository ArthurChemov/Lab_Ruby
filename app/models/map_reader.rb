class MapReader < ApplicationRecord
  belongs_to :library
  has_many :users
end
