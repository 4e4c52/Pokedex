# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Type, type: :model do
  let!(:type) { create(:type, name: 'First type') }

  it 'returns its name with to_s' do
    expect(type.to_s).to eq('First Type')
  end

  it 'has a unique name' do
    duplicate_type = build(:type, name: 'First type')
    expect(duplicate_type.valid?).to be false
    expect(duplicate_type.errors.full_messages).to include('Name has already been taken')
  end
end
