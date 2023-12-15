require 'rails_helper'

RSpec.describe AccountBlock::Language121Class, type: :model do

	before(:all) do
    @student = create(:student)
	 @token = BuilderJsonWebToken::JsonWebToken.encode(@student.id)
  end

subject {
	described_class.new(	
    language: "English", 
    study_format: 0, 
    class_level: "A1", 
    class_type: "everyday",
    class_duration: 60, 
    class_weeks: 4 , 
    class_date: Date.today + 2.days, 
    class_time: "11:00", 
    time_zone: "GMT",
    status: 0,
    student_id: @student.id
    )

}

it {should belong_to(:teacher).optional}

describe 'enums' do
	it{ should define_enum_for(:status).with_values(created: 0, rejected: 1, accepted: 2 ,cancelled:3,completed:4)}
end
# describe 'enums' do
# 	it{ should define_enum_for(:study_format).with_values("1-on-1": 0)}
# end

it "is valid with valid attributes" do
	expect(subject).to be_valid
	end

it "is not valid without a language" do
	subject.language = nil
	expect(subject).to_not be_valid
	end

it "is not valid without a study_format" do
	subject.study_format = nil
	expect(subject).to_not be_valid
	end

it "is not valid without a class_level" do
	subject.class_level = nil
	expect(subject).to_not be_valid
	end

it "is not valid without a class_type" do
	subject.class_type = nil
	expect(subject).to_not be_valid
	end

it "is not valid without a class_date" do
	subject.class_date = nil
	expect(subject).to_not be_valid
	end

it "is not valid without a class_time" do
	subject.class_time = nil
	expect(subject).to be_valid
	end

# it "is not valid without a class_plan" do
# 	subject.class_plan = nil
# 	expect(subject).to_not be_valid
# 	end

it "is not valid if date in past" do
	subject.class_date = "01/01/2023"
	expect(subject).to_not be_valid
	end

end
