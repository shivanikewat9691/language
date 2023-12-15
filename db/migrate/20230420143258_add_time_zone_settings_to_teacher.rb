class AddTimeZoneSettingsToTeacher < ActiveRecord::Migration[6.0]
  def change
  	# add_column :teachers, :time_zone, :string
    add_column :teachers, :date_format, :string
    add_column :teachers, :time_format, :string
  end
end
