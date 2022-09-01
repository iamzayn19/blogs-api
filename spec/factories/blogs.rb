FactoryBot.define do
  factory :blog do
    title { "DC is great!" }
    body  { "The Batman is DC's latest film in 2022. It is the best movie of all time." }
    user_id { 1 }
  end
end
