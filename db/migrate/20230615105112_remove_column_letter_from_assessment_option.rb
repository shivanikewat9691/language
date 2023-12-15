class RemoveColumnLetterFromAssessmentOption < ActiveRecord::Migration[6.0]
  def change
  	remove_column :assessment_options, :letter
  end
end
