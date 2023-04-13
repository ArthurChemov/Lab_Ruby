require 'faker'

class GenresController < ApplicationController
  def insert_genres
    100.times do
      Genre.create(
        name: Faker::Book.genre
      )
    end
    redirect_to root_path
  end
  def update_record(new_name)
    update_attributes(name: new_name)
  end
end
