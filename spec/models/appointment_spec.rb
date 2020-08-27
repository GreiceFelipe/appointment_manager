require 'rails_helper'

RSpec.describe Appointment, type: :model do
  it { is_expected.to(validate_presence_of(:starts_at)) }

  describe 'Validates' do
    

    context 'with valid factory' do
      let(:appointment) { build(:appointment) }
      it { expect(appointment).to(be_valid) }
    end

    context 'with invalid starts_at' do
      let!(:appointment) { create(:appointment) }
      let(:appointment_8h) { build(:appointment, starts_at: Time.new(2015, 8, 1, 8, 0, 0)) }
      let(:appointment_19h) { build(:appointment, starts_at: Time.new(2015, 8, 1, 19, 0, 0)) }
      let(:appointment_12h) { build(:appointment, starts_at: Time.new(2015, 8, 1, 12, 0, 0)) }
      let(:appointment_same_range) { build(:appointment, starts_at: Time.new(2015, 8, 1, 10, 10, 0)) }
     
      it { expect(appointment_8h).not_to(be_valid) }
      it { expect(appointment_19h).not_to(be_valid) }
      it { expect(appointment_12h).not_to(be_valid) }
      it { expect(appointment_same_range).not_to(be_valid) }
    end
  end
end
