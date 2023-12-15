class AddColumn < ActiveRecord::Migration[6.0]
  def change
     add_column :teachers, :bio, :text
  end
end
