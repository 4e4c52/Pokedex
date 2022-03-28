# frozen_string_literal: true

json.call(@pokemon, :id, :name, :height, :weight, :base_experience)
json.types do
  json.array! @pokemon.types, partial: 'types/type', as: :type
end
