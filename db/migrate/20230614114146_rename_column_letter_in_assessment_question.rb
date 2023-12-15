class RenameColumnLetterInAssessmentQuestion < ActiveRecord::Migration[6.0]
  def change
  	rename_column :assessment_questions, :letter, :question_no
  end
end
