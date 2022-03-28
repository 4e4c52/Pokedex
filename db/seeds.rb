# frozen_string_literal: true

p 'Importing Types...'
Importers::Types.import

p 'Importing Pokemons (this might take a while)...'
Importers::Pokemons.import
