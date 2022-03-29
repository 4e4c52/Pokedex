# frozen_string_literal: true

Rails.logger.debug 'Importing Types...'
Importers::Types.import

Rails.logger.debug 'Importing Pokemons (this might take a while)...'
Importers::Pokemons.import
