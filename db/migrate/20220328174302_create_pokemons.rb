# frozen_string_literal: true

class CreatePokemons < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemons do |t|
      t.string :name, nil: false
      t.integer :height, default: 0
      t.integer :weight, default: 0
      t.integer :base_experience, default: 0

      t.timestamps
    end

    add_index :pokemons, :name, unique: true
  end
end
