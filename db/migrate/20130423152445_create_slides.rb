class CreateSlides < ActiveRecord::Migration
  def change
  	create_table :slides do |t|
  		t.string :name
  		t.text :description
  		t.references :user
  	end
  end
end
