class Library < ApplicationRecord
  has_many :books
  has_many :map_readers
end
