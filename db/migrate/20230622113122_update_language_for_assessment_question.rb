class UpdateLanguageForAssessmentQuestion < ActiveRecord::Migration[6.0]
  def change
    remove_column :assessment_questions, :language, :string
    add_column :assessment_questions, :language, :integer
  end
end
