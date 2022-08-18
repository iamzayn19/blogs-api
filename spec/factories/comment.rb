FactoryBot.define do
  factory :comment do
    text { "sample comment"}
    blog_id { 41 }
    user_id { 1 }
  end
end