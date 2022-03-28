# frozen_string_literal: true

class PokemonsController < ApplicationController
  before_action :set_pokemon, only: :show
  after_action :set_pagination_headers, only: :index

  def index
    @pagy, @pokemons = pagy(Pokemon.includes(:types))
  end

  def show; end

  private

  def set_pokemon
    @pokemon = Pokemon.find(params[:id])
  end

  def set_pagination_headers
    pagy_headers_merge(@pagy)
  end
end
