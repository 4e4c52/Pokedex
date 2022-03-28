# frozen_string_literal: true

class Type < ApplicationRecord
  # Associations
  has_and_belongs_to_many :pokemons

  # Validations
  validates :name, presence: true, uniqueness: true

  def to_s
    name.titleize
  end
end
