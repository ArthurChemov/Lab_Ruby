class MapReader < ApplicationRecord
  belongs_to :library, optional: true
  belongs_to :user
end
