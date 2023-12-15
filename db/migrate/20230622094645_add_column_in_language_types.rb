class AddColumnInLanguageTypes < ActiveRecord::Migration[6.0]
  def change
  	add_column :language_types, :name, :integer
  end
end
