require 'rails_helper'

RSpec.describe AccountBlock::Assessment, type: :model do
  
  subject {
	described_class.new(language: "German",
		assessment_level: "A1",
		assessment_score: "63",
		assessment_grade: "C2",
		assessment_date: "01/07/2023",
		)
}


it "is valid with valid attributes" do
	expect(subject).to be_valid
	end

it "is not valid without a language" do
	subject.language = nil
	expect(subject).to_not be_valid
	end

it "is not valid without assessment_level" do
	subject.assessment_level = nil
	expect(subject).to_not be_valid
	end

it "is not valid without assessment_score" do
	subject.assessment_score = nil
	expect(subject).to_not be_valid
	end

it "is not valid without assessment_grade" do
	subject.assessment_grade = nil
	expect(subject).to_not be_valid
	end

it "is not valid without assessment_date" do
	subject.assessment_date = nil
	expect(subject).to_not be_valid
	end

end
 