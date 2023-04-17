class MapReader < ApplicationRecord
  belongs_to :library, optional: true
  has_many :users
end
