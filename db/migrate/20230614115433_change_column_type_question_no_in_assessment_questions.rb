class ChangeColumnTypeQuestionNoInAssessmentQuestions < ActiveRecord::Migration[6.0]
  def change
  	change_column :assessment_questions, :question_no, :integer, using: 'CAST(question_no AS integer)'
  end
end
