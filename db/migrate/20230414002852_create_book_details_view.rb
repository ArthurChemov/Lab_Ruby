class CreateBookDetailsView < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      CREATE VIEW book_details AS
        SELECT books.title, books.year, authors.name AS author_name, authors.surname AS author_surname
        FROM books
        JOIN authors ON books.author_id = authors.id
    SQL
  end

  def down
    execute <<-SQL
      DROP VIEW book_details
    SQL
  end
end
