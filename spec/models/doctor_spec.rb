# frozen_string_literal: true

require('rails_helper')

RSpec.describe(Doctor, type: :model) do
  it { is_expected.to(validate_presence_of(:name)) }
  it { is_expected.to(validate_presence_of(:crm)) }
  it { is_expected.to(validate_presence_of(:crm_uf)) }

  it { is_expected.to(validate_uniqueness_of(:crm).scoped_to(:crm_uf)) }

  describe 'Validates' do

    context 'with valid factory' do
      let(:doctor) { build(:doctor) }
      it { expect(doctor).to(be_valid) }
    end

    context 'with appointments' do
      let!(:doctor) { create(:doctor) }
      let!(:doctor_with_appointment) { create(:doctor) }
      let!(:appointment) { create(:appointment, doctor: doctor_with_appointment) }

      it { expect { doctor_with_appointment.destroy }.to change { Doctor.count }.by(0) }
      it { expect { doctor.destroy }.to change { Doctor.count }.by(-1) }
    end
  end
end
