class AddDefaultCapacityForClasses < ActiveRecord::Migration[6.0]
  def change
  	change_column :language_classes, :students_min, :integer, default: 3
  	change_column :language_classes, :students_max, :integer, default: 8
  end
end
