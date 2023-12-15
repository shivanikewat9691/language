require 'rails_helper'

RSpec.describe AccountBlock::Language121ClassesController, type: :controller do

  before do
  	@student = create(:student)
	 @token = BuilderJsonWebToken::JsonWebToken.encode(@student.id)
    @language121_class =  AccountBlock::Language121Class.create(
		language: "English", 
    study_format: "1-on-1", 
    class_level: "A1", 
    class_type: "everyday",
    class_duration: 60, 
    class_weeks: 4 , 
    class_date: Date.today + 3.days, 
    class_time: "11:00", 
    time_zone: "GMT",
    student_id: @student.id
    )
    	#binding.pry
  end

  let(:language121_class_params) {{ language: "German",
		study_format: "1-on-1",
		class_level: "A1",
		class_type: "everyday",
		class_duration: 90,
		class_plan: "German_Group_A1_Daily",
		class_date: "01/07/2024",
		class_date: "01/07/2023",
    time_zone: "GMT",
		class_date: "01/07/2030",
		class_time: "11:00",
		class_weeks: 4 } }
	let(:invalid_params) {{ language: "German",
		study_format: "Group",
		class_level: "A1",
		class_type: "Daily",
		class_plan: "German_Group_A1_Daily",
		class_date: "01/07/2030",
		class_time: "11:00" } }
  let(:missing_params) {{ language: "German",
		study_format: "Group",
		class_time: "11:00" } }
	let(:patch_params) {{ language: "English",
		study_format: "Group",
		class_time: "15:00" } }

  context 'create_language_class' do
    it 'should create a 1-om-1_class when post request is made' do
        request.headers.merge!(token:@token)
      post :create , params: language121_class_params
      expect(response).to have_http_status :created
    end
  end 

	context 'get all records' do
    it 'should show the count at least 1' do
        request.headers.merge!(token:@token)
      get :index 
      expect(response).to have_http_status :ok
    end
    it 'No one on one class found' do
        request.headers.merge!(token:@token)
        AccountBlock::Language121Class.destroy_all
      get :index 
      expect(JSON.parse(response.body)["error"]
        ).to eq("No 1-on-1 classes found")
    end
  end 
end
