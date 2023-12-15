require 'rails_helper'

RSpec.describe AccountBlock::AssessmentQuestion, type: :model do
  
  subject {
	described_class.new(language: "English",
		question: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsam, aperiam!",
		question_no: "2",
		answer: "Lorem 3 ipsum dolor sit amet consectetur adipisicing elit. Error, quos.",
		)
}


context 'associations' do
	it { should have_many(:assessment_options).class_name('AccountBlock::AssessmentOption') }
end
it "is not valid without a language" do
	subject.language = nil
	expect(subject).to_not be_valid
	end

it "is not valid without question" do
	subject.question = nil
	expect(subject).to_not be_valid
	end

it "is not valid without question_no" do
	subject.question_no = nil
	expect(subject).to_not be_valid
	end

it "is not valid without answer" do
	subject.answer = nil
	expect(subject).to_not be_valid
	end

end
