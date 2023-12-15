class AddColumnInStudents < ActiveRecord::Migration[6.0]
  def change
  	 add_column :students, :display_language, :string
  end
end
