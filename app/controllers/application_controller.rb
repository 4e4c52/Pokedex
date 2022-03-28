# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Pagy::Backend

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: { status: 404, error: exception.to_s }, status: :not_found
  end
end
