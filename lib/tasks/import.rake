# frozen_string_literal: true

namespace :import do
  desc 'Import Pokemon Types into the database'
  task types: :environment do
    Importers::Types.import
  end

  desc 'Import Pokemons into the database'
  task pokemons: :environment do
    Importers::Pokemons.import
  end
end
