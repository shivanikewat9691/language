class AddFieldsToLanguageCourses < ActiveRecord::Migration[6.0]
  def change
  	add_column :language_courses, :country, :integer
  	add_column :language_courses, :study_format, :integer
  end
end
