class CreateUsersDetailsView < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      CREATE VIEW users_details AS
        SELECT users.name, users.surname, users.email
        FROM users
    SQL
  end

  def down
    execute <<-SQL
      DROP VIEW users_details
    SQL
  end
end
