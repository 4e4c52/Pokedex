# frozen_string_literal: true

require 'poke-api-v2'

# Import the Pokemon into the database
module Importers
  class Pokemons
    LIMIT = 100

    def self.import
      retrieve_pokemons
    end

    def self.retrieve_pokemons(imported: 0)
      response = PokeApi.get(pokemon: { limit: LIMIT, offset: imported })

      process_results(results: response.results)

      imported += LIMIT

      # Process next pokemons if any
      retrieve_pokemons(imported:) if imported < response.count
    rescue JSON::ParserError => e
      # The underlying gem doesn't handle errors and just throw JSON parsing errors
      Rails.logger.debug "Pokemon retrieval failed with error #{e}"
    end

    def self.process_results(results: [])
      results.each do |result|
        # Here we don't have other choice to query them for every Pokemon
        # In order to get the extra details
        raw_pokemon = PokeApi.get(pokemon: result.name)

        Pokemon.create_or_find_by(id: raw_pokemon.id) do |p|
          p.name = raw_pokemon.name
          p.height = raw_pokemon.height
          p.weight = raw_pokemon.weight
          p.base_experience = raw_pokemon.base_experience
          p.type_ids = retrieve_type_ids(raw_types: raw_pokemon.types)
        end
      end
    rescue JSON::ParserError => e
      Rails.logger.debug "Pokemon retrieval failed with error #{e}"
    end

    def self.retrieve_type_ids(raw_types: [])
      raw_types.map do |raw_type|
        # Use the same shortcut to get the type id
        # As the import is already slow
        id = raw_type.type.url.split('/').last

        # Find first as we expect the type to already exist
        Type.find_or_create_by!(id:) do |t|
          t.name = raw_type.type.name
        end

        id
      end
    end
  end
end
