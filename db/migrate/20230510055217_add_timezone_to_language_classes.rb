class AddTimezoneToLanguageClasses < ActiveRecord::Migration[6.0]
  def change
  	add_column :language_classes, :time_zone, :string
  end
end
