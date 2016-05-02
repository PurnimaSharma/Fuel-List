desc "adding average price and fuel price of zipcodes"
task :fetching_fuel_price => :environment do
    require 'mechanize'
    agent = Mechanize.new
	agent.get("http://www.gasbuddy.com/")
	form = agent.page.forms.first
	Zipcode.all.each do |zipcode|
	  form.search  = zipcode[:zipcode]
	  form.submit	 
	  avgprice = agent.page.search("#trend-by-site .text-center")[0].text.split.last
      lowprice = agent.page.search("#trend-by-site .text-center")[1].text.split.last 
      ZipcodeFuelPrice.create("avg_price" => avgprice ,"lowest_price" =>lowprice ,"zipcodes_id" => zipcode.id) 
	end
end