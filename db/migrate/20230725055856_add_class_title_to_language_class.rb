class AddClassTitleToLanguageClass < ActiveRecord::Migration[6.0]
  def change
    add_column :language_classes, :class_title, :string
  end
end
