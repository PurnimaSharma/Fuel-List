desc "adding average price and fuel price of zipcodes"
task :fetching_fuel_price => :environment do
    require 'mechanize'
    agent = Mechanize.new
	agent.get("http://www.gasbuddy.com/")
	form = agent.page.forms.first
	Zipcode.all.each do |zipcode|
	  form.search  = zipcode[:zip_name]
	    agent.page.search(".gb-price-lg")
        #Zipcode_fuel_price.create(:avg_price => )
	end
end