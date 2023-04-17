class User < ApplicationRecord
  belongs_to :map_reader, optional: true
end
