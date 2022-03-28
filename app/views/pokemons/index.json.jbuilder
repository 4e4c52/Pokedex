# frozen_string_literal: true

json.array! @pokemons, partial: 'pokemons/pokemon', as: :pokemon
