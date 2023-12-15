require 'rails_helper'

RSpec.describe AccountBlock::InviteeTeachersController, type: :controller do

  before :context do
    @invitee_teacher = FactoryBot.create(:invitee_teacher)
  end  

  describe "Get activate account" do
    before do
      invitee_teacher = create(:invitee_teacher)
      @token = BuilderJsonWebToken.encode(invitee_teacher.id, 1.year.from_now)
    end
    context "when activate account" do
      it "Your Account Is Activated" do
        get :activate_account, params: {token: @token}
        expect(response).to have_http_status(302)
      end 
    end
  end

  describe "Get invitee teacher names" do
    before do
      invitee_teacher = create(:invitee_teacher)
      @token = BuilderJsonWebToken.encode(invitee_teacher.id, 1.year.from_now)
    end
    
    context "when request names of account" do
      it "You should send names" do
        get :invitee_teacher_names, params: {token: @token}
        expect(response).to have_http_status(200)
      end 
    end
  end
     
end

