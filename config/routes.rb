# frozen_string_literal: true

Rails.application.routes.draw do
  defaults format: :json do
    root 'pokemons#index'

    resources :pokemons, only: %i[index show]
  end

  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
end
