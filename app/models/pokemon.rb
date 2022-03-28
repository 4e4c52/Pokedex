# frozen_string_literal: true

class Pokemon < ApplicationRecord
  # Associations
  has_and_belongs_to_many :types

  # Validations
  validates :name, presence: true, uniqueness: true
  validates :height, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :weight, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :base_experience, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def to_s
    name.titleize
  end
end
