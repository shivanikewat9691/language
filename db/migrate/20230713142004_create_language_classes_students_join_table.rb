class CreateLanguageClassesStudentsJoinTable < ActiveRecord::Migration[6.0]
  def change
  	create_join_table :language_classes, :students
  end
end
