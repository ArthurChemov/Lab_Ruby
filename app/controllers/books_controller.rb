require 'faker'

class BooksController < ApplicationController
  def insert_books
    100.times do
      library_id = Library.pluck(:id)
      author_id = Author.pluck(:id)
      genre_id = Genre.pluck(:id)

      Book.create(
        title: Faker::Book.title,
        year: Faker::Date.between(from: 50.years.ago, to: Date.today),
        library_id: library_id,
        author_id: author_id,
        genre_id: genre_id
      )
    end
    redirect_to root_path
  end
  def update_record(new_title, new_year, library_id, author_id, genre_id)
    update_attributes(title: new_title, year: new_year, library_id: library_id, author_id: author_id, genre_id: genre_id)
  end
end
