class RemoveColumnInStudyFormates < ActiveRecord::Migration[6.0]
  def change
  	remove_column :study_formats, :name, :string
  end
end
