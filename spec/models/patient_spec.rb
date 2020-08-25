# frozen_string_literal: true

require('rails_helper')

RSpec.describe(Patient, type: :model) do
  it { is_expected.to(validate_presence_of(:name)) }
  it { is_expected.to(validate_presence_of(:birth_date)) }
  it { is_expected.to(validate_presence_of(:cpf)) }

  describe 'Validates' do
    let(:patient) { create(:patient) }

    context 'with valid factory' do
      it { expect(patient).to(be_valid) }
    end

    context 'with invalid CPF' do
      let(:invalid_patient) { build(:patient, cpf: '1123') }

      it { expect(invalid_patient).not_to(be_valid) }
    end
  end
end
