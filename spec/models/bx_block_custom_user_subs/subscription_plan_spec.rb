require 'rails_helper'
require 'faker'

RSpec.describe BxBlockCustomUserSubs::SubscriptionPlan, type: :model do
  
  it "is expected to validate that" do 
    expect(should validate_presence_of(:name))
  end
  
  it { should validate_presence_of(:price_per_month) }
  it { should validate_presence_of(:description) }

  it { should have_many(:features) }
end

