class CreateStudyFormats < ActiveRecord::Migration[6.0]
  def change
    create_table :study_formats do |t|
    	t.string :name
    	t.string :logo

      t.timestamps
    end
  end
end
