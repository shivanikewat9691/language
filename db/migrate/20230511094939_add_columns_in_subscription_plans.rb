class AddColumnsInSubscriptionPlans < ActiveRecord::Migration[6.0]
  def change
  	add_column :subscription_plans, :language, :string
  	add_column :subscription_plans, :logo, :string
  end
end
