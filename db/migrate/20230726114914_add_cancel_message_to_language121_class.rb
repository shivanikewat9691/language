class AddCancelMessageToLanguage121Class < ActiveRecord::Migration[6.0]
  def change
    add_column :language121_classes, :cancel_message, :string
  end
end
