class AddOccursOnToClasses < ActiveRecord::Migration[6.0]
  def change
    add_column :language_classes, :occurs_on, :string
  end
end
