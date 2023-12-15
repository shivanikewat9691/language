class AddColumnInTeachers < ActiveRecord::Migration[6.0]
  def change
  	add_column :teachers, :display_language, :string
  end
end
