class AddColumnsToLanguageCourses < ActiveRecord::Migration[6.0]
  def change
  	add_column :language_courses, :language, :integer
  	add_column :language_courses, :category, :string
  	add_column :language_courses, :course_duration, :integer
  	add_column :language_courses, :language_type, :integer
  	add_column :language_courses, :language_level, :integer
  end
end
