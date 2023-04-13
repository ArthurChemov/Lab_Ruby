require 'faker'

class UsersController < ApplicationController
  def insert_users
    100.times do
      User.connection.execute(
        "INSERT INTO users (name, surname, email)
        VALUES (Faker::Name.first_name, Faker::Name.last_name, Faker::Internet.email)")
    end
    redirect_to root_path
  end
  def self.update_record(id, new_name, new_surname, new_email)
    connection.execute("UPDATE users SET name = '#{new_name}', surname = '#{new_surname}', email = '#{new_email}' WHERE id = #{id}")
  end
end