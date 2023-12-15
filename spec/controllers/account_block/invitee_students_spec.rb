require 'rails_helper'

RSpec.describe AccountBlock::InviteeStudentsController, type: :controller do

  before :context do
    @invitee_student = FactoryBot.create(:invitee_student)
  end  

  describe "Get activate account" do
    before do
      invitee_student = create(:invitee_student)
      @token = BuilderJsonWebToken.encode(invitee_student.id, 1.year.from_now)
    end
    context "when activate account" do
      it "Your Account Is Activated" do
        get :activate_account, params: {token: @token}
        expect(response).to have_http_status(302)
      end 
    end
  end

  describe "Get invitee student names" do
    before do
      invitee_student = create(:invitee_student)
      @token = BuilderJsonWebToken.encode(invitee_student.id, 1.year.from_now)
    end
    
    context "when request names of account" do
      it "You should send names" do
        get :invitee_student_names, params: {token: @token}
        expect(response).to have_http_status(200)
      end 
    end
  end
     
end

