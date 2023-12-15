class AddColumnQuestionNoToAssessmentOptions < ActiveRecord::Migration[6.0]
  def change
  	add_column :assessment_options, :assessment_question_no, :integer
  end
end
