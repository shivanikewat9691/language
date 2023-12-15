class AddColumns < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :date_of_birth, :datetime
    # add_column :accounts, :city, :string
    add_column :accounts, :country, :string
    add_column :accounts, :language_taught, :string
    add_column :accounts, :teaching_style, :string
    add_column :accounts, :personal_intrest, :string
    add_column :accounts, :background_of_industries, :string
    add_column :accounts, :time_zone, :string
  end
end
