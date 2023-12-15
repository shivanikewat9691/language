class AddColumnLanguageToAssessmentQuestion < ActiveRecord::Migration[6.0]
  def change
  	add_column :assessment_questions, :language, :string
  end
end
