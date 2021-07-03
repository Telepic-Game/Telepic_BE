FactoryBot.define do
  factory :game do
    active { false }
    game_summary { "" }
    turn_counter { 1 }
  end
end
