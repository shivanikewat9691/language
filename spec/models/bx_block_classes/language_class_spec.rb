require 'rails_helper'

RSpec.describe BxBlockClasses::LanguageClass, type: :model do

subject {
	described_class.new(language: "German",
		study_format: "Group",
		class_level: "A1",
		class_type: "Daily",
		class_plan: "German_Group_A1_Daily",
		class_date: "01/07/2033",
		class_time: "11:00")
}

 before(:all) do
    @language_class = create(:language_class)
  end

describe "Assocciation" do 
	it{should belong_to(:language_course).class_name("AccountBlock::LanguageCourse").optional}
end

it "is valid with valid attributes" do
	expect(@language_class).to be_valid
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
	expect(subject).to_not be_valid
	end
=begin
it "is not valid without a class_plan" do
	subject.class_plan = nil
	expect(subject).to_not be_valid
	end
=end
it "is not valid if date in past" do
	subject.class_date = "01/01/2023"
	expect(subject).to_not be_valid
	end

end
