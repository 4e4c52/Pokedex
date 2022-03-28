# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Importers::Pokemons do
  it 'imports the Pokemons from the API' do
    # Just fetch the one hundred first Pokemons
    allow_any_instance_of(PokeApi::ApiResourceList).to receive(:count).and_return(100)

    VCR.use_cassette 'pokemons' do
      expect { Importers::Pokemons.import }.to change { Pokemon.count }.by(100)

      first_pokemon = Pokemon.first

      expect(first_pokemon.name).to eq('bulbasaur')
      expect(first_pokemon.type_ids).to eq([4, 12])
    end
  end
end
