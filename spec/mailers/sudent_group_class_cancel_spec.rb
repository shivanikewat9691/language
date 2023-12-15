RSpec.describe BxBlockNotifications::StudentGroupClassCancelMailer, type: :mailer do
    describe '#student_canceled_class' do
      specify do
        @student = FactoryBot.create(:student)
    
        mailer = described_class.student_canceled_class(@student, Date.today, DateTime.now, "Group class").deliver_now
        #binding.pry
        expect(mailer.subject).to eq("Your group lesson was cancelled")
      end
    end
  end