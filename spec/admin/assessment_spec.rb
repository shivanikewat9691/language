require 'rails_helper'
require 'spec_helper'

include Warden::Test::Helpers

RSpec.describe Admin::AssessmentsController, type: :controller do
    render_views
    let(:admin) { AdminUser.create(email: 'admin@example.com', password: "password") }
    QUESTION = "whats your name"
    before(:each) do
      sign_in admin
    end

    let(:invalid_assessment_questions_params) {{
      "level": "",
      "question": "Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsam, aperiam!",
      "question_no": 3,
      "answer": "Lorem 3 ipsum dolor sit amet consectetur adipisicing elit. Error, quos",
      "language": "English"
    }} 

    describe 'Admin::AssessmentsController' do
      describe "create subscription plan" do
        it "will create assessment question" do
        post :create, params: { level:"Hard",question_no:1,question:QUESTION,answer:"Anonymous",language:"english"}
        expect(response.status).to eq(200)
        end
      end

      it 'not create the assessment questions ' do
        request.headers.merge!(token:@token)
        post :create, params: invalid_assessment_questions_params
        expect(response).to have_http_status(200)
      end
    end
    describe "get to index" do
      it "get request" do
        get :index
        expect(response).to have_http_status(200)
      end
    end
end
