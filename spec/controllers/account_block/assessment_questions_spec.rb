require 'rails_helper'

RSpec.describe AccountBlock::AssessmentQuestionsController, type: :controller do
  
  let(:valid_assessment_questions_params) {{
    "question": "Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsam, aperiam!",
    "question_no": 3,
    "answer": "Lorem 3 ipsum dolor sit amet consectetur adipisicing elit. Error, quos",
    "language": "English"
  }} 

  let(:invalid_assessment_questions_params) {{
    "question": "",
    "question_no": 3,
    "answer": "Lorem 3 ipsum dolor sit amet consectetur adipisicing elit. Error, quos",
    "language": "English"
  }} 

  before :context do
    @student = FactoryBot.create(:student)
    @token = BuilderJsonWebToken::JsonWebToken.encode(@student.id)
    @question = AccountBlock::AssessmentQuestion.create({
    language: 'English',
    question: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsam, aperiam!',
    question_no: 2,
    answer: 'Lorem 2 ipsum dolor sit amet consectetur adipisicing elit. Error, quos'
})
    asmt_option = AccountBlock::AssessmentOption.create({
    assessment_question_no: 2,
    answer: 'Lorem 1 ipsum dolor sit amet consectetur adipisicing elit. Error, quos.',
    assessment_question_id: @question.id
})
  end

  describe "post/create assessment questions" do

    it 'not create the assessment questions ' do
      request.headers.merge!(token:@token)
      post :create, params: invalid_assessment_questions_params
      expect(response).to have_http_status(422)
    end
  end 
end

