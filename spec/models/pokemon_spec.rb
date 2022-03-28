# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Pokemon, pokemon: :model do
  let!(:pokemon) { create(:pokemon, name: 'First pokemon') }

  it 'returns its name with to_s' do
    expect(pokemon.to_s).to eq('First Pokemon')
  end

  it 'has a unique name' do
    duplicate_pokemon = build(:pokemon, name: 'First pokemon')
    expect(duplicate_pokemon.valid?).to be false
    expect(duplicate_pokemon.errors.full_messages).to include('Name has already been taken')
  end
end
