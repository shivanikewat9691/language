class AddLanguageNameInLanguages < ActiveRecord::Migration[6.0]
  def change
  	add_column :languages, :language_name, :integer
  end
end
