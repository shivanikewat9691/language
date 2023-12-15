class AddTeacherToLanguage121Class < ActiveRecord::Migration[6.0]
  def change
    add_reference :language121_classes, :teacher
  end
end
