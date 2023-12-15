class CreateLanguageTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :language_types do |t|
    	t.string :name
    	t.string :logo

      t.timestamps
    end
  end
end
