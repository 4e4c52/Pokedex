# frozen_string_literal: true

FactoryBot.define do
  factory :type do
    sequence(:name) { |n| "Type #{n}" }
  end
end
