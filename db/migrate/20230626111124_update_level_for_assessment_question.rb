class UpdateLevelForAssessmentQuestion < ActiveRecord::Migration[6.0]
  def change
    remove_column :assessment_questions, :level, :string
  end
end
