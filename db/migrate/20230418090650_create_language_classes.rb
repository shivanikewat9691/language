class CreateLanguageClasses < ActiveRecord::Migration[6.0]
  def change
    create_table :language_classes do |t|
    	t.string :language
      t.string :study_format
      t.string :class_level
      t.string :class_type
      t.string :class_plan
      t.date :class_date
      t.time :class_time
      t.timestamps
    end
  end
end
