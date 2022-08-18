FactoryBot.define do
  factory :user do
    first_name { "Mark" }
    last_name  { "Paul" }
    email { "mark@gmail.com" }
    user_type { 1 }
    password { "usama" }
  end
end
