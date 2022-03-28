# frozen_string_literal: true

class CreatePokemonsTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemons_types, id: false do |t|
      t.references :pokemon, null: false, foreign_key: true
      t.references :type, null: false, foreign_key: true

      t.timestamps
    end

    add_index :pokemons_types, %i[pokemon_id type_id], unique: true
  end
end
