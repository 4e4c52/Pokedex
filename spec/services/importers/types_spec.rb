# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Importers::Types do
  it 'imports the types from the API' do
    VCR.use_cassette 'types' do
      expect { Importers::Types.import }.to change { Type.count }.by(20)
      expect(Type.first.name).to eq('normal')
    end
  end
end
