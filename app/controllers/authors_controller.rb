require 'faker'

class AuthorsController < ApplicationController
  def insert_authors
    100.times do
      Author.create(
        name: Faker::Name.first_name,
        surname: Faker::Name.last_name,
        bio: Faker::Lorem.paragraphs(number: 3).join("\n\n")
      )
    end
    redirect_to root_path
  end
  def update_record(new_name, new_surname, new_bio)
    update_attributes(name: new_name, surname: new_surname, bio: new_bio)
  end
end
