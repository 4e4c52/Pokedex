# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'pokemons', type: :request do
  # before do
  #   create_list(:pokemon, 3)
  # end

  path '/pokemons' do
    get('List the Pokemons') do
      tags 'Pokemons'
      produces 'application/json'
      consumes 'application/json'

      parameter name: 'page', in: :query, type: :integer, description: 'Page number', required: false

      let!(:pokemons) { create_list(:pokemon, 3) }

      response(200, 'Successful') do
        header 'Current-Page', type: :integer, description: 'The current page number'
        header 'Page-Items', type: :integer, description: 'The number of items in the current page'
        header 'Total-Pages', type: :integer, description: 'The total number of pages'
        header 'Total-Count', type: :integer, description: 'The total number of Pokemons'

        examples 'application/json' => [
          {
            "id": 1,
            "name": 'bulbasaur',
            "types": [
              {
                "id": 4,
                "name": 'poison'
              },
              {
                "id": 12,
                "name": 'grass'
              }
            ]
          },
          {
            "id": 2,
            "name": 'ivysaur',
            "types": [
              {
                "id": 4,
                "name": 'poison'
              },
              {
                "id": 12,
                "name": 'grass'
              }
            ]
          }
        ]

        it 'Return 3 Pokemons' do
          body = JSON(response.body)
          expect(body.count).to eq(3)
        end

        run_test!
      end
    end
  end

  path '/pokemons/{id}' do
    get('Show a Pokemon') do
      tags 'Pokemons'
      produces 'application/json'
      consumes 'application/json'

      parameter name: :id, in: :path, type: :integer, description: 'The Pokemon ID', required: true

      let!(:pokemon) { create(:pokemon) }

      response(200, 'Successful') do
        let(:id) { 1 }

        examples 'application/json' => {
          "id": 1,
          "name": 'bulbasaur',
          "types": [
            {
              "id": 4,
              "name": 'poison'
            },
            {
              "id": 12,
              "name": 'grass'
            }
          ]
        }

        it 'Return the Pokemon' do
          body = JSON(response.body)
          expect(body['id']).to eq(1)
        end

        run_test!
      end

      response(404, 'Pokemon not found') do
        let(:id) { 4 }

        examples 'application/json' => {
          "status": 404,
          "error": "Couldn't find Pokemon with 'id'=4"
        }

        run_test!
      end
    end
  end
end
