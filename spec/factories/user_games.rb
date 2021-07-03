FactoryBot.define do
  factory :user_game do
    game { nil }
    user { nil }
    stack { nil }
    user_story { "" }
    username { "MyString" }
  end
end
