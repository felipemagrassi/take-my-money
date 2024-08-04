# frozen_string_literal: true

FactoryBot.define do
  factory :performance do
    event { nil }
    start_time { 2.minutes.ago }
    end_time { Time.zone.now }
  end
end
