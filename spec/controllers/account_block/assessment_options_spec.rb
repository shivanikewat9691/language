require 'rails_helper'

RSpec.describe AccountBlock::AssessmentOptionsController, type: :controller do
  
  let(:valid_assessment_questions_params) {{
    "answer": "A2",
    "assessment_question_id":  FactoryBot.create(:assessment_question).id,
    "assessment_question_no": 3
  }} 

  let(:invalid_assessment_questions_params) {{
    "answer": "A2",
    "assessment_question_id": "1000",
    "assessment_question_no": 3
  }} 

  before :context do
    @student = FactoryBot.create(:student)
    @token = BuilderJsonWebToken::JsonWebToken.encode(@student.id)
  end

  describe "post/create assessment options" do

    it 'not create the assessment options ' do
      request.headers.merge!(token:@token)
      post :create, params: invalid_assessment_questions_params
      expect(response).to have_http_status(422)
    end
  end
end

