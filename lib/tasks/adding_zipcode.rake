desc "fetching zipcode name"
task :fetch_zip_code => :environment do
  require 'nokogiri'
  require 'open-uri' 
  url = "http://www.city-data.com/zipDir.html"
  doc = Nokogiri::HTML(open(url))
  links = doc.css(".col-xs-6").css('a')
  hrefs = links.map {|link| link.attribute('href').to_s}.uniq
  hrefs.each do |href|
    master_url = "http://www.city-data.com/#{href}"
    doc = Nokogiri::HTML(open(master_url))
    doc.css(".col-xs-6").each do |zipcode|
     Zipcode.create("zipcode" => zipcode.text.gsub('zip code', ''))
    end
  end
end