class CreateLanguages < ActiveRecord::Migration[6.0]
  def change
    create_table :languages do |t|
      t.string :language_name
      t.string :logo

      t.timestamps
    end
  end
end
