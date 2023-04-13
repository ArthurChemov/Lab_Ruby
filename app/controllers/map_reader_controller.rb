require 'faker'

class MapReaderController < ApplicationController
  def insert_map_reader
    100.times do
      library_ID = Library.pluck(:id)
      user_ID = User.pluck(:id)

      MapReader.connection.execute(
        "INSERT INTO map_reader (library_id, user_id)
        VALUES (library_ID, user_ID)")
    end
    redirect_to root_path
  end
  def self.update_record(id, new_library_id, new_user_id)
    connection.execute("UPDATE map_reader SET library_id = '#{new_library_id}', user_id = '#{new_user_id}' WHERE id = #{id}")
  end
end
