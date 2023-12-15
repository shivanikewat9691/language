
require 'rails_helper'
RSpec.describe "AccountBlock::TeacherPasswordResetsController", type: :request do
FORGOT_URL = '/account_block/teacher_forgot_password'
RESET_URL = '/account_block/teacher_reset_password'
let(:teacher) { create(:teacher)}
let(:token) {  BuilderJsonWebToken.encode teacher.id, 10.minutes.from_now}
let(:invalid_token) {  BuilderJsonWebToken.encode teacher.id, 0.seconds.from_now}
let(:email_params) { { email: teacher.email } }
  context "when user enters correct login email " do
    before do
        post FORGOT_URL, params: email_params
    end
    it 'generates password_reset_email' do
      expect(response).to have_http_status(:ok)
      expect(response.body).to eq({ message: 'Password reset link sent' }.to_json)
    end
  end
  context "when user enters incorrect login email for password reset" do
    it 'does not password_reset_email' do
      post FORGOT_URL, params: {"email": "abc@example.com"}
      expect(JSON.parse(response.body)['error']).to eq(['Email address not found. Please check and try again.'])
    end
  end
  context "when user enters token and new password" do
    it 'resets user password' do
      post RESET_URL, params: {"token": token, "password": "A01@pass"}
      expect(JSON.parse(response.body)['message']).to eq('Password Reset Successful!')
    end
  end
  context "when user enters wrong token and new password" do
    it 'raises error' do
      post RESET_URL, params: {"token": invalid_token, "password": "A01@pass"}
      expect(JSON.parse(response.body)['error']).to eq('Token error')
    end
  end
 end
