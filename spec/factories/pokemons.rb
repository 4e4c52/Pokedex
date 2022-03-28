# frozen_string_literal: true

FactoryBot.define do
  factory :pokemon do
    sequence(:name) { |n| "Pokemon #{n}" }
    height { 7 }
    weight { 14 }
    base_experience { 1 }
  end
end
