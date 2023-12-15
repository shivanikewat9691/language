require 'rails_helper'

RSpec.describe BxBlockLandingpage3::FrequentlyAskedQuestion, type: :model do
   subject {
	described_class.new(
		title: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsam, aperiam!",
		description: "Lorem 3 ipsum dolor sit amet consectetur adipisicing elit. Error, quos."
		)
}
it "is valid with valid attributes" do
	expect(subject).to be_valid
	end

it "is not valid without a title" do
	subject.title = nil
	expect(subject).to_not be_valid
	end

it "is not valid without description" do
	subject.description = nil
	expect(subject).to_not be_valid
	end
end

