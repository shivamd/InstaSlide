class CreateAuthentications < ActiveRecord::Migration
  def change
  	create_table :authetications do |t|
  		t.integer :user_id
  		t.string :provider
  		t.string :uid
  		t.string :access_token
  	end
  end
end
