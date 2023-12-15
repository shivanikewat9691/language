class ChangeFieldToLanguage121Class < ActiveRecord::Migration[6.0]
  def change
    remove_column :language121_classes, :study_format, :string
    add_column :language121_classes, :study_format, :integer
  end
end
