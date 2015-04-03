class CreateReComments < ActiveRecord::Migration
  def change
    create_table :re_comments do |t|

      t.timestamps null: false
    end
  end
end
