require 'csv'

namespace :import do
  desc "Import data from library.csv file"
  task library: :environment do
    file_path = 'libraries_7.csv' # шлях до файлу library.csv
    csv_data = CSV.read(file_path, headers: true, encoding: 'UTF-8')

    csv_data.each do |row|
      Library.create(
        name: row["Library Name"],
        year: row["Submission Year"],
        street_address: row["Street Address"],
        city: row["City"],
        zip_code: row["Zip Code"]
      )
    end
  end
end