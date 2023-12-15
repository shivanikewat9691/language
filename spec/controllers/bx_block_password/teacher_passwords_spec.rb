require 'rails_helper'

RSpec.describe BxBlockPassword::TeacherPasswordsController, type: :controller do 

	TEACHER_EMAIL = "teacher@example.com"
	PASSWORD_URL = :change_password

let(:wrong_email_params) {{ 	email: "s@example.com", old_password: "password", new_password: "password" }}
let(:wrong_password_params) {{ 	email: TEACHER_EMAIL, old_password: "wrong", new_password: "A01@pass" }}
let(:teacher_password_params) {{ 	email: TEACHER_EMAIL, old_password: "password", new_password: "A01@pass" }}

  before do
    @teacher = AccountBlock::Teacher.create(first_name: "raj", last_name: "k", email: TEACHER_EMAIL, password: "password")
    @teacher.update(activated: true)
    @token = BuilderJsonWebToken::JsonWebToken.encode(@teacher.id)
  end 

	context "when teacher enters wrong email and new password" do
		it 'throws error Email or Password wrong' do
			request.headers.merge!(token: @token)
			put PASSWORD_URL, params: wrong_email_params
			expect(response).to have_http_status(422)
		end
	end

	context "when teacher enters wrong email and new password" do
		it 'throws error Email or Password wrong' do
			request.headers.merge!(token: @token)
			put PASSWORD_URL, params: wrong_password_params
			expect(response).to have_http_status(422)
		end
	end

	context "when teacher enters correct email and password" do
		it 'updates the password with new password' do
			request.headers.merge!(token: @token)
			put PASSWORD_URL, params: teacher_password_params
			expect(response).to have_http_status(201)
		end
	end

end