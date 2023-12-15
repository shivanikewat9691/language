class AddClassDescriptionToClasses < ActiveRecord::Migration[6.0]
  def change
    add_column :language_classes, :class_description, :text
  end
end
