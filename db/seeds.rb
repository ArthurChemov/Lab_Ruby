# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

class AuthorSeeder
  def self.insert
    100.times do
      Author.create(
        name: Faker::Name.first_name,
        surname: Faker::Name.last_name,
        bio: Faker::Lorem.paragraphs(number: 3).join("\n\n"),
        created_at: Time.now,
        updated_at: Time.now
      )
    end
  end

  def self.update(id, new_name, new_surname, new_bio)
    author = Author.find(id)
    author.update(name: new_name, surname: new_surname, bio: new_bio, updated_at: Time.now)
  end
end

class BookSeeder
  def self.insert
    100.times do
      library_id = Library.pluck(:id).sample
      author_id = Author.pluck(:id).sample
      genre_id = Genre.pluck(:id).sample

      Book.create(
        title: Faker::Book.title,
        year: Faker::Date.between(from: 50.years.ago, to: Date.today).year,
        library_id: library_id,
        author_id: author_id,
        genre_id: genre_id,
        created_at: Time.now,
        updated_at: Time.now
      )
    end
  end

  def self.update(id, new_title, new_year, library_id, author_id, genre_id)
    book = Book.find(id)
    book.update(title: new_title, year: new_year, library_id: library_id, author_id: author_id, genre_id: genre_id, updated_at: Time.now)
  end
end

class GenreSeeder
  def self.insert
    100.times do
      Genre.create(
        name: Faker::Book.genre,
        created_at: Time.now,
        updated_at: Time.now
      )
    end
  end

  def self.update(id, new_name)
    genre = Genre.find(id)
    genre.update(title: new_name, updated_at: Time.now)
  end
end

class LibrarySeeder
  def self.insert
    100.times do
      Library.connection.execute("
      INSERT INTO libraries (name, address, created_at, updated_at)
      VALUES ('#{Faker::Company.name}', '#{Faker::Address.full_address}', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
    ")
    end
  end

  def self.update(id, new_name, new_address)
    ActiveRecord::Base.connection.execute("
    UPDATE libraries SET name = '#{new_name}', address = '#{new_address}', updated_at = CURRENT_TIMESTAMP WHERE id = #{id};
  ")
  end
end

class MapReaderSeeder
  def self.insert
    100.times do
      library_id = Library.pluck(:id).sample
      user_id = User.pluck(:id).sample

      MapReader.connection.execute("
      INSERT INTO map_readers (library_id, user_id, created_at, updated_at)
      VALUES (#{library_id}, #{user_id}, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
    ")
    end
  end

  def self.update(id, new_library_id, new_user_id)
    ActiveRecord::Base.connection.execute("
    UPDATE map_reader SET library_id = '#{new_library_id}', user_id = '#{new_user_id}', updated_at = CURRENT_TIMESTAMP WHERE id = #{id};
  ")
  end
end

class UserSeeder
  def self.insert
    100.times do
      User.connection.execute("
      INSERT INTO users (name, surname, email, created_at, updated_at)
      VALUES ('#{Faker::Name.first_name}', '#{Faker::Name.last_name}', '#{Faker::Internet.email}', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
    ")

    end
  end

  def self.update(id, new_name, new_surname, new_email)
    ActiveRecord::Base.connection.execute("
    UPDATE users SET name = '#{new_name}', surname = '#{new_surname}', email = '#{new_email}', updated_at = CURRENT_TIMESTAMP WHERE id = #{id};
  ")
  end
end