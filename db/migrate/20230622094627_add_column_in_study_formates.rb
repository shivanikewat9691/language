class AddColumnInStudyFormates < ActiveRecord::Migration[6.0]
  def change
  	add_column :study_formats, :name, :integer
  end
end
