class AddColumnInLanguageCourse < ActiveRecord::Migration[6.0]
  def change
  	add_column :language_courses, :student_ids, :integer, array: true, default: []
  end
end
