require 'spec_helper'
require 'rails_helper'
RSpec.describe AccountBlock::AccountsController, type: :controller do
  before :context do
    @account = FactoryBot.create(:account)
    @token = BuilderJsonWebToken::JsonWebToken.encode(@account.id)
  end
  
  describe 'update user profile' do
    it 'update user first name and last name' do
      request.headers.merge!(token: @token)
      put :update, params: {id: @account.id}.merge({phone_number: '1234567890', email: "sivakumar@gmail.com", first_name: "sivakumar", last_name: "bellamkonda" })
      expect(@account.reload.first_name).to eq("sivakumar")
      expect(@account.reload.last_name).to eq("bellamkonda")
    end  
  end
end
