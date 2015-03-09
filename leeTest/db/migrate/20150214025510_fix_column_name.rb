class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :tweets, :title, :content
  end
end
