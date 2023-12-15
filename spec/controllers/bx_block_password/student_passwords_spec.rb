require 'rails_helper'

RSpec.describe BxBlockPassword::StudentPasswordsController, type: :controller do 

	STUDENT_EMAIL = "student@example.com"
	PASSWORD_URL = "/bx_block_password/student_change_password"

let(:wrong_email_params) {{ 	email: "s@example.com", old_password: "password", new_password: "new_password" }}
let(:wrong_password_params) {{ 	email: STUDENT_EMAIL, old_password: "wrong", new_password: "new_password" }}

  before do
  	@student = FactoryBot.create(:student)
    @student.update(activated: true)
    @token = BuilderJsonWebToken::JsonWebToken.encode(@student.id)
  end 

let(:student_password_params) {{ 	email: @student.email, old_password: "blahblah", new_password: "A01@pass" }}


	context "when student enters correct email and password" do
		it 'updates the password with new password' do
      request.headers.merge!(token: @token)
			put :change_password, params: student_password_params
			expect(response).to have_http_status(201)
		end
	end

	context "when student enters wrong email and new password" do
		it 'throws error Email or Password wrong' do
			request.headers.merge!(token: @token)
			put :change_password,  params: wrong_email_params
			expect(response).to have_http_status(422)
		end
	end

	context "when student enters wrong email and new password" do
		it 'throws error Email or Password wrong' do
			request.headers.merge!(token: @token)
			put :change_password, params: wrong_password_params
			expect(response).to have_http_status(422)
		end
	end

end
