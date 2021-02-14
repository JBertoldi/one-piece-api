FactoryBot.define do
  factory :devil_fruit do
    name { ' gomu gomu no mi' }
    power_type { 'Awesomeness' }
  end

  factory :pirate_crew do
    name { ' straw Hat' }
  end

  factory :character do
    en_name { 'monkey d. luffy  ' }
    jp_name { 'Lala' }
    epithet { "I'm gonna become the pirate king" }
  end
end
