# frozen_string_literal: true

require 'poke-api-v2'

# Import the Pokemon types into the database
module Importers
  class Types
    LIMIT = 100

    def self.import
      retrieve_types
    end

    def self.retrieve_types(imported: 0)
      response = PokeApi.get(type: { limit: LIMIT, offset: imported })

      process_results(results: response.results)

      imported += LIMIT

      # Process next types if any
      retrieve_types(imported:) if imported < response.count
    end

    def self.process_results(results: [])
      results.each do |result|
        # We retrieve the ID from the URL so we save a call to the API
        # And don't flood them with extra queries.
        id = result.url.split('/').last

        Type.create_or_find_by(id:) do |t|
          t.name = result.name
        end
      end
    end
  end
end
