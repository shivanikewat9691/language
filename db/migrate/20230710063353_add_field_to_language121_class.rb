class AddFieldToLanguage121Class < ActiveRecord::Migration[6.0]
  def change
      remove_column :language121_classes, :class_time, :time
      add_column :language121_classes, :class_time, :datetime
  end
end
