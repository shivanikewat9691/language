class AddColumnToTeachers < ActiveRecord::Migration[6.0]
  def change
  	add_column :teachers, :uniq_id, :string
  end
end
