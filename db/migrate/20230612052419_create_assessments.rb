class CreateAssessments < ActiveRecord::Migration[6.0]
  def change
    create_table :assessments do |t|
    	t.integer :student_id
    	t.string :assessment_level
    	t.integer :assessment_score
    	t.string :assessment_grade
    	t.date :assessment_date
      t.timestamps
    end
  end
end
