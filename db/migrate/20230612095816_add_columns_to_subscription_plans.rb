class AddColumnsToSubscriptionPlans < ActiveRecord::Migration[6.0]
  def change
  	add_column :subscription_plans, :isPopular, :boolean, default: false
  	add_column :subscription_plans, :isCurrent, :boolean, default: false
  end
end
