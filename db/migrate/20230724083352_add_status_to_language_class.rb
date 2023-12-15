class AddStatusToLanguageClass < ActiveRecord::Migration[6.0]
  def change
    add_column :language_classes, :status, :integer
  end
end
