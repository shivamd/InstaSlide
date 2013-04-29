class AddSecureUrlToSlides < ActiveRecord::Migration
  def change
    add_column :slides, :secure_url, :string
  end
end
