FactoryBot.define do
  factory :player_game do
    game { nil }
    player { nil }
    stack { nil }
    player_story { "" }
    playername { "MyString" }
  end
end
