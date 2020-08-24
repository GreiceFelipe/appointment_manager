# frozen_string_literal: true

require('rails_helper')

RSpec.describe(Doctor, type: :model) do
  it { is_expected.to(validate_presence_of(:name)) }
  it { is_expected.to(validate_presence_of(:crm)) }
  it { is_expected.to(validate_presence_of(:crm_uf)) }

  it { is_expected.to(validate_uniqueness_of(:crm).scoped_to(:crm_uf)) }

  describe 'Validates' do
    let(:doctor) { create(:doctor) }

    context 'with valid factory' do
      it { expect(doctor).to(be_valid) }
    end

    # TODO: 3.1 - It should not be possible to exclude doctors who have linked patients
  end
end
