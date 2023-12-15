class CreateAssessmentQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :assessment_questions do |t|
			t.string :level
		  t.string :question
		  t.string :letter
		  t.string :answer
      t.timestamps
    end
  end
end
