class CreateFeatures < ActiveRecord::Migration[6.0]
  def change
    create_table :features do |t|
      t.integer :subscription_plan_id
      t.string :description

      t.timestamps
    end
  end
end