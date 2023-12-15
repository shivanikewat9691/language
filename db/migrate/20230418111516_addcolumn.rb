class Addcolumn < ActiveRecord::Migration[6.0]
  def change
    add_column :teachers, :phone_number, :integer
  end
end
