require 'nokogiri'
require 'open-uri'

namespace :wiki do
  desc 'Parse the List of Libraries page on Wikipedia'
  task parse_libraries: :environment do
    url = 'https://en.wikipedia.org/wiki/List_of_libraries'
    user_agent = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3'

    doc = Nokogiri::HTML(URI.open(url, 'User-Agent' => user_agent))

    File.open('libraries.txt', 'w') do |file|
      doc.css('div.mw-parser-output > ul > li > a:first-child').each do |link|
        name = link.content
        file.puts name
      end
    end
  end
end