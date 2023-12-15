class RemoveColumnInLanguageTypes < ActiveRecord::Migration[6.0]
  def change
  	remove_column :language_types, :name, :string
  end
end
