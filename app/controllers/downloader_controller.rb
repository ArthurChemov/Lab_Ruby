class DownloaderController < ApplicationController
  require 'open-uri'
  require 'uri'
  def download_libraries_users_info_csv
    @library = Library.all
    send_data generate_libraries_users_info_csv(@library), filename: 'Libraries_users_info.csv', type: 'application/csv'
  end

  def generate_libraries_users_info_csv(library)
    CSV.generate do |csv|
      # Записуємо заголовки колонок
      csv << ['Library ID', 'Library Name', 'Library Address', 'User Name', 'User Surname', 'User Email']

      # Для кожної бібліотеки записуємо інформацію про всіх її користувачів
      library.each do |library|
        csv << [library.id, library.name, library.address, library.map_readers.first&.user&.name, library.map_readers.first&.user&.surname, library.map_readers.first&.user&.email]
      end
    end
  end

  def download_libraries_users_info_pdf
    @library = Library.all
    send_data generate_libraries_users_info_pdf(@library), filename: 'Libraries_users_info.pdf', type: 'application/pdf'
  end

  def generate_libraries_users_info_pdf(library)
    pdf = Prawn::Document.new

    pdf.font_families.update( "Arial" => {
      :normal => "arial.ttf",
      :bold => "arialbd.ttf"
    }
    )
    pdf.font("Arial", :style => :bold)
    # Define table header
    table_header = ["Name", "Address", "Street", "City", "ZIP", "User", "User email"]
    table_data = [table_header]

    # Populate table data
    library.each do |library|
      library_data = []
      library_data << library.name if library.name.present? || ''
      library_data << library.address if library.address.present? || ''
      library_data << library.street_address if library.street_address.present? || ''
      library_data << library.city if library.city.present? || ''
      library_data << library.zip_code if library.zip_code.present? || ''
      library_data << "#{library.map_readers.first&.user&.name} #{library.map_readers.first&.user&.surname}".strip if library.map_readers.first&.user&.name.present? && library.map_readers.first&.user&.surname.present? || ''
      library_data << library.map_readers.first&.user&.email if library.map_readers.first&.user&.email.present? || ''
      table_data << library_data
    end

    # Define table style
    pdf.table(table_data, :header => true) do |table|
      table.row_colors = ["DDDDDD", "FFFFFF"]
      table.column_widths = { 0 => 80, 1 => 80, 2 => 80, 3 => 80, 4 => 50, 5 => 80, 6 => 90 }
      table.header = true
      table.row(0).font_style = :bold
    end
    pdf.render
  end

  def download_libraries_info_pdf
    @library = Library.all
    send_data generate_libraries_info_pdf(@library), filename: 'Libraries_info.pdf', type: 'application/pdf'
  end

  def generate_libraries_info_pdf(library)
    pdf = Prawn::Document.new

    pdf.font_families.update( "Arial" => {
        :normal => "arial.ttf",
        :bold => "arialbd.ttf"
      }
    )
    pdf.font("Arial", :style => :bold)
    # Define table header
    table_header = ["Name", "Address", "Street", "City", "ZIP"]
    table_data = [table_header]

    # Populate table data
    library.each do |library|
      library_data = []
      library_data << library.name if library.name.present? || ''
      library_data << library.address if library.address.present? || ''
      library_data << library.street_address if library.street_address.present? || ''
      library_data << library.city if library.city.present? || ''
      library_data << library.zip_code if library.zip_code.present? || ''
      table_data << library_data
    end

    pdf.text "Libraries", align: :center

    pdf.image URI.open("https://zn.ua/img/article/4875/4_main-v1646979094.jpg"), width: 504, height: 320
    pdf.move_down 10

    # Define table style
    pdf.table(table_data, :header => true) do |table|
      table.row_colors = ["DDDDDD", "FFFFFF"]
      table.column_widths = { 0 => 100, 1 => 100, 2 => 100, 3 => 100, 4 => 100 }
      table.header = true
      table.row(0).font_style = :bold
    end
    pdf.render
  end

  def download_users_info_pdf
    @user = User.all
    send_data generate_users_info_pdf(@user), filename: 'Users_info.pdf', type: 'application/pdf'
  end

  def generate_users_info_pdf(user)
    pdf = Prawn::Document.new

    pdf.font_families.update( "Arial" => {
        :normal => "arial.ttf",
        :bold => "arialbd.ttf"
      }
    )
    pdf.font("Arial", :style => :bold)

    # Define table header
    table_header = ["Name", "Surname", "Email"]
    table_data = [table_header]

    # Populate table data
    user.each do |user|
      user_data = []
      user_data << user.name if user.name.present? || ''
      user_data << user.surname if user.surname.present? || ''
      user_data << user.email if user.email.present? || ''
      table_data << user_data
    end

    # Define table style
    pdf.table(table_data, :header => true) do |table|
      table.row_colors = ["DDDDDD", "FFFFFF"]
      table.column_widths = { 0 => 100, 1 => 100, 2 => 200 }
      table.header = true
      table.row(0).font_style = :bold
    end
    pdf.render
  end
end
