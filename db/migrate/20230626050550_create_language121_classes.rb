class CreateLanguage121Classes < ActiveRecord::Migration[6.0]
  def change
    create_table :language121_classes do |t|
			t.string :language
      t.string :study_format
      t.string :class_level
      t.string :class_type
      t.integer :class_duration
      t.integer :class_weeks
      t.string :class_plan
      t.date :class_date
      t.time :class_time
      t.string :time_zone
      t.references :student
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
