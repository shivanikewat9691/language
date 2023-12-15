class AddColumnsToTeachers < ActiveRecord::Migration[6.0]
  def change
    add_column :teachers, :date_of_birth, :datetime
    add_column :teachers, :city, :string
    add_column :teachers, :country, :string
    add_column :teachers, :language_taught, :string
    add_column :teachers, :teaching_style, :string
    add_column :teachers, :personal_intrest, :string
    add_column :teachers, :background_of_industries, :string
    add_column :teachers, :time_zone, :string
  end
end
