class AddLanguageToAssessments < ActiveRecord::Migration[6.0]
  def change
    add_column :assessments, :language, :string
  end
end
