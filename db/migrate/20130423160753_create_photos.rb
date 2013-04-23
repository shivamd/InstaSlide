class CreatePhotos < ActiveRecord::Migration
  def change
  	create_table :photos do |t|
  		t.string :url
  		t.references :user
  		t.references :slide
  	end
  end
end
