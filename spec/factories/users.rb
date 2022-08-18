FactoryBot.define do
  factory :user do
    first_name { "Mark" }
    last_name  { "Paul" }
    email { "usama@gmail.com" }
    user_type { 1 }
    password { "usamaamir" }
  end
end
