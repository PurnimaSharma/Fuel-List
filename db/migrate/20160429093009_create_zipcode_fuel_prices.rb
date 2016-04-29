class CreateZipcodeFuelPrices < ActiveRecord::Migration
  def change
    create_table :zipcode_fuel_prices do |t|
      t.string :avg_price
      t.string :lowest_price
      t.timestamps null: false
    end
  end
end
