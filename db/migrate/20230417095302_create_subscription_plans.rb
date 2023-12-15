class CreateSubscriptionPlans < ActiveRecord::Migration[6.0]
  def change
    create_table :subscription_plans do |t|
      t.string :name
      t.string :price_and_month
      t.text :description
      
      t.timestamps
    end
  end
end
