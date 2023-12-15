require 'rails_helper'

RSpec.describe BxBlockLandingpage3::FrequentlyAskedQuestionsController, type: :controller do

  let(:valid_frequently_asked_questions_params) {{
   "title": "Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsam, aperiam!",
   "description": "Lorem 3 ipsum dolor sit amet consectetur adipisicing elit. Error, quos"
  }}

 let(:invalid_assessment_questions_params) {{
    "title": "",
    "description": ""
  }} 

  before :context do
    @student = FactoryBot.create(:student)
    @token = BuilderJsonWebToken::JsonWebToken.encode(@student.id)
  end

  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe "post/create frequently asked questions" do

    it 'create the frequently asked questions ' do
      request.headers.merge!(token:@token)
      post :create, params: valid_frequently_asked_questions_params
      expect(response).to have_http_status(201)
    end

    it 'not create the frequently asked questions ' do
      request.headers.merge!(token:@token)
      post :create, params: invalid_assessment_questions_params
      expect(response).to have_http_status(422)
    end
  end
end