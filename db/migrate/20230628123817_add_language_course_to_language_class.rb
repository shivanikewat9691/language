class AddLanguageCourseToLanguageClass < ActiveRecord::Migration[6.0]
  def change
    add_reference :language_classes, :language_course, null: true, foreign_key: true
  end
end
