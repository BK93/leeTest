class CreateComments < ActiveRecord::Migration
  def change
    #create_table :comments do |t|
      unless table_exists? :comments
	  
      t.timestamps null: false
    end
  end
end
