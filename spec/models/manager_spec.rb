# frozen_string_literal: true

require('rails_helper')

RSpec.describe(Manager, type: :model) do
  it { is_expected.to(validate_presence_of(:name)) }

  describe 'Validates' do
    let(:manager) { create(:manager) }

    context 'with valid factory' do
      it { expect(manager).to(be_valid) }
    end
  end
end
