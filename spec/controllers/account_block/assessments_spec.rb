require 'rails_helper'

RSpec.describe AccountBlock::AssessmentsController, type: :controller do
 
 LOREM = "Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsam, aperiam!"
 let(:user_params) {{
 	# {
  "language": "english",
    "test_level": "A1",
   "user_answers": [
{
      "id": 1,
      "questionNo": 1,
      "question": LOREM,
      "selectedValue": "Lorem 1 ipsum dolor sit amet consectetur adipisicing elit. Error, quos"
},
{
      "id": 2,
      "questionNo": 2,
      "question": LOREM,
      "selectedValue": "Lorem 2 ipsum dolor sit amet consectetur adipisicing elit. Error, quos"
},
{
      "id": 3,
      "questionNo": 3,
      "question": LOREM,
      "selectedValue": "Lorem 2 ipsum dolor sit amet consectetur adipisicing elit. Error, quos"
},
{
      "id": 4,
      "questionNo": 4,
      "question": LOREM,
      "selectedValue": "Lorem 4 ipsum dolor sit amet consectetur adipisicing elit. Error, quos"
},
{
      "id": 5,
      "questionNo": 5,
      "question": LOREM,
      "selectedValue": "Lorem 3 ipsum dolor sit amet consectetur adipisicing elit. Error, quos"
}
]
 }}  
   before :context do
   	@student = FactoryBot.create(:student)
@token = BuilderJsonWebToken::JsonWebToken.encode(@student.id)
end

describe "post/create assessment test" do
  it 'returns success response ' do
  	  request.headers.merge!(token:@token)
    get  :get_test 
    data = JSON.parse(response.body)
    expect(response).to have_http_status(200)
  end

  it 'returns students score ' do

  	  request.headers.merge!(token:@token)
     post :create, params: user_params
     # data = JSON.parse(response.body)
      expect(response).to have_http_status(200)
  end
end
  
end

