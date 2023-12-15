RSpec.describe BxBlockClasses::GroupClassCancelWorker, type: :worker do
    describe '#perform' do
      let(:current_time) { Time.now }
      let!(:language_class_1) { create(:language_class, class_date: current_time + 25.hours, status: :created) }
      let!(:language_class_2) { create(:language_class, class_date: current_time + 23.hours, status: :created) }
      let!(:language_class_3) { create(:language_class, class_date: current_time + 25.hours, status: :created) }
  
      before do
        allow(Time).to receive(:now).and_return(current_time)
      end
  
      it 'cancels language classes that are not minimally booked' do
        allow(language_class_1).to receive(:minimaly_booked?).and_return(true)
        allow(language_class_2).to receive(:minimaly_booked?).and_return(false)
        allow(language_class_3).to receive(:minimaly_booked?).and_return(true)
  
        expect(language_class_1).not_to receive(:update)
        expect(language_class_2).not_to receive(:update)
        expect(language_class_3).not_to receive(:update)
  
        described_class.new.perform
      end
    end
  end