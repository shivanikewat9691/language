require 'rails_helper'
require 'faker'

RSpec.describe BxBlockCustomUserSubs::Feature, type: :model do
  
  it "is expected to validate that" do 
    expect(should validate_presence_of(:description))
  end

  it { should belong_to(:subscription_plan) }
end

