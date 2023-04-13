require 'faker'

class LibrariesController < ApplicationController
  def insert_libraries
    100.times do
      Library.connection.execute(
        "INSERT INTO libraries (name, address)
        VALUES (Faker::Company.name, Faker::Address.full_address)")
    end
    redirect_to root_path
  end
  def self.update_record(id, new_name, new_address)
    connection.execute("UPDATE libraries SET name = '#{new_name}', address = '#{new_address}' WHERE id = #{id}")
  end
end
