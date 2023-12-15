require 'rails_helper'
RSpec.describe "AccountBlock::StudentPasswordResetsController", type: :request do
SFORGOT_URL = '/account_block/student_forgot_password'
S_RESET_URL = '/account_block/student_reset_password'
let(:student) { create(:student)} 
let(:token) {  BuilderJsonWebToken.encode student.id, 10.minutes.from_now}
let(:invalid_token) {  BuilderJsonWebToken.encode student.id, 0.seconds.from_now}
let(:email_params) { { email: student.email } }


  context "when user enters correct login email " do
    before do
        post SFORGOT_URL, params: email_params
    end
    
    it 'generates password_reset_email' do
      expect(response).to have_http_status(:ok)
    end
  end
  context "when user enters incorrect login email for password reset" do
    it 'does not password_reset_email' do
      post SFORGOT_URL, params: {"email": "abc@example.com"}
      expect(JSON.parse(response.body)['error']).to eq(['Email address not found. Please check and try again.'])
    end
  end
  context "when user enters token and new password" do
    it 'resets user password' do
      post S_RESET_URL, params: {"token": token, "password": "A01@pass"}
      expect(JSON.parse(response.body)['message']).to eq('Password Reset Successful!')
    end
  end
  context "when user enters wrong token and new password" do
    it 'raises error' do
      post S_RESET_URL, params: {"token": invalid_token, "password": "A01@pass"}
      expect(JSON.parse(response.body)['error']).to eq('Token error')
    end
  end
 end
