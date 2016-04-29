class AddReference < ActiveRecord::Migration
  def change
  	add_reference :zipcode_fuel_prices, :zipcodes
  end
end
