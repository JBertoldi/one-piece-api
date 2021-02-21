FactoryBot.define do
  factory :rubber_fruit, class: DevilFruit do
    name { ' gomu gomu no mi' }
    power_type { 'Awesomeness' }
  end

  factory :straw_hats, class: PirateCrew do
    name { ' straw Hats' }
  end

  factory :luffy, class: Character do
    en_name { 'monkey d. luffy  ' }
    jp_name { 'Lala' }
    epithet { "I'm gonna become the pirate king" }
    association :pirate_crew, factory: :straw_hats
    association :devil_fruit, factory: :rubber_fruit
  end

  factory :zoro, class: Character do
    en_name { 'roronoa zOro' }
    jp_name { 'Lalalong' }
    epithet { 'Santoryu' }
    association :pirate_crew, factory: :straw_hats
  end

  # For characters that share the same devil fruit
  factory :luffy2, class: Character do
    en_name { 'monkey d. luffyy  ' }
    jp_name { 'Lalaa' }
    epithet { "I'm gonna become the pirate kingg" }
    association :pirate_crew, factory: :straw_hats
    association :devil_fruit, factory: :rubber_fruit
  end
end
