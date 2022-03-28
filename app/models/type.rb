# frozen_string_literal: true

class Type < ApplicationRecord
  # Validations
  validates :name, presence: true, uniqueness: true

  def to_s
    name.titleize
  end
end
