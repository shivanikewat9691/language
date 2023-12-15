require 'rails_helper'
require 'faker'

RSpec.describe BxBlockCustomUserSubs::LanguageType, type: :model do
  
  it "is expected to validate that" do 
    expect(should validate_presence_of(:name))
  end
  
  it { should validate_presence_of(:logo) }
end

