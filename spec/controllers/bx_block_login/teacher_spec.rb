require 'rails_helper'

RSpec.describe BxBlockLogin::TeachersController, type: :request do

REQUEST_EMAIL = 'test@example.com'
LOGIN_URL = '/bx_block_login/teachers'
UPDATE_URL = '/account_block/teachers/1'

  before do
    @teacher = AccountBlock::Teacher.create(first_name: "raj", last_name: "k", email: REQUEST_EMAIL, password: "A01@pass")
  end

  context "when user logs in before activation" do
      it "returns activation err" do
        post LOGIN_URL, params: { email: REQUEST_EMAIL, password: "password" }
        expect(response).to have_http_status(422)
        expect(JSON.parse(response.body)['message']).to eq('Your Account is not activated')
      end
    end

    context "when user logs in after activation" do
      it "returns a 201 status code" do
         @teacher.update(activated: true)
        post LOGIN_URL, params: { email: REQUEST_EMAIL, password: "A01@pass" }
        expect(response).to have_http_status(201)
      end
    end

    context "when user enters wrong login credentials" do
      it "returns wrong email activation error" do
         @teacher.update(activated: true)
        post LOGIN_URL, params: { email: "nomail@nomail.com", password: "password" }
        expect(response).to have_http_status(422)
        expect(JSON.parse(response.body)['message']).to eq('Invalid email or password')
      end
    end

  context "when user enters wrong login credentials" do
      it "returns wrong password activation error" do
         @teacher.update(activated: true)
        post LOGIN_URL, params: { email: REQUEST_EMAIL, password: "wrongpass" }
        expect(response).to have_http_status(422)
        expect(JSON.parse(response.body)['message']).to eq('Invalid email or password')
      end
    end
  context "when user tries log in after his account is deactivated" do
      it "returns Deactivated error" do
        # put UPDATE_URL,  params: {id: @teacher, uniq_id: 'T1234567'}
        @teacher.update(uniq_id: 'T1234567')
        post LOGIN_URL, params: { email: REQUEST_EMAIL, password: "password" }

        expect(response).to have_http_status(422)
        expect(JSON.parse(response.body)['message']).to eq('Your Account is deactivated')
      end
    end
    
end