FactoryBot.define do
  factory :user do
    first_name { "Usama" }
    last_name  { "Khan" }
    email { "usama@gmail.com" }
    user_type { 1 }
    password { "usamaamir" }
  end
end
