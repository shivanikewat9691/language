class AddFieldsToSubscriptionPlans < ActiveRecord::Migration[6.0]
  def change	
  	add_column :subscription_plans, :study_format, :integer
  	add_column :subscription_plans, :language_type, :integer
  end
end
