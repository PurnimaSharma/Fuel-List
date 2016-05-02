class Rename < ActiveRecord::Migration
  def change
  	rename_column :zipcodes ,:zip_name, :zipcode
  end
end
