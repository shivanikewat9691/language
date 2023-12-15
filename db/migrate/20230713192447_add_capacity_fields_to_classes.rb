class AddCapacityFieldsToClasses < ActiveRecord::Migration[6.0]
  def change
  	add_column :language_classes, :students_min, :integer
  	add_column :language_classes, :students_max, :integer
  end
end
