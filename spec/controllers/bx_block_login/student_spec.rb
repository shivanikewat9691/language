require 'rails_helper'

RSpec.describe "Login API", type: :request do

  SLOGIN_URL = '/bx_block_login/students'
  SREQUEST_EMAIL = 'student@example.com'

  let(:login_params) {{ "email": "student@example.com", "password": "password" } }
  before do
    @student = AccountBlock::Student.create(first_name: "raj", last_name: "k", email: SREQUEST_EMAIL, password: "password", company: "Abc ltd")
  end 
    
  context "when user enters correct login credentials" do
      it "should not allow login if not activated" do
        post SLOGIN_URL, params: login_params 
         expect(JSON.parse(response.body)['message']).to eq('Your Account is not activated')
      end
    end

  context "when user enters correct login credentials" do
      it "should allow login after activation" do
         @student.update(activated: true)
        post SLOGIN_URL, params: { email: SREQUEST_EMAIL, password: "password" }
        expect(response).to have_http_status(201)
      end
    end

  context "when user enters wrong login credentials" do
      it "returns wrong email activation error" do
         @student.update(activated: true)
        post SLOGIN_URL, params: { email: "nomail@nomail.com", password: "password" }
        expect(response).to have_http_status(422)
        expect(JSON.parse(response.body)['message']).to eq('Invalid email or password')
      end
    end

  context "when user enters wrong login credentials" do
      it "should not allow login " do
         @student.update(activated: true)
        post SLOGIN_URL, params: { email: SREQUEST_EMAIL, password: "wrongpwd" }
        expect(JSON.parse(response.body)['message']).to eq('Invalid email or password')
      end
    end

  context "when user tries log in after his account is deactivated" do
      it "returns Deactivated error" do
        # put UPDATE_URL,  params: {id: @teacher, uniq_id: 'T1234567'}
        @student.update(uniq_id: 'S1234567')
        post SLOGIN_URL, params: { email: SREQUEST_EMAIL, password: "password" }

        expect(response).to have_http_status(422)
        expect(JSON.parse(response.body)['message']).to eq('Your Account is deactivated')
      end
    end

end