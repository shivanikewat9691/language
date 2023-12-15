require 'rails_helper'
require 'faker'

RSpec.describe BxBlockLandingpage3::Language, type: :model do
  
  it "is expected to validate that" do 
    expect(should validate_presence_of(:language_name))
  end
  
  it { should validate_presence_of(:logo) }
end

