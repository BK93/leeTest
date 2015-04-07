class CreateReLikes < ActiveRecord::Migration
  def change
    create_table :re_likes do |t|

      t.timestamps null: false
    end
  end
end
