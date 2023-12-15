class AddLanguageInSubscriptionPlans < ActiveRecord::Migration[6.0]
  def change
  	add_column :subscription_plans, :language, :integer
  end
end
