# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    name { 'Name' }
    description { 'Description' }
    image_url { 'URI' }
  end
end
