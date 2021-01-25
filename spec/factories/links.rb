FactoryBot.define do
  factory :link do
    url { Faker::Internet.url }
    slug { rand(36**8).to_s(36) }
  end
end
