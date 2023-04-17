class Genre < ApplicationRecord
  belongs_to :book, optional: true
end
