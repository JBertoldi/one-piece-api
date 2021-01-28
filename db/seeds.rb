puts 'Destroying characters..'
Character.destroy_all

puts 'Destroying fruits..'
DevilFruit.destroy_all

puts 'Destroying crews..'
PirateCrew.destroy_all

Faker::UniqueGenerator.clear

puts 'Creating fruits..'
30.times do
  DevilFruit.create!(name: Faker::Food.unique.fruits, power_type: Faker::JapaneseMedia::OnePiece.akuma_no_mi)
end

puts 'Creating crews..'
5.times do
  PirateCrew.create!(name: Faker::JapaneseMedia::OnePiece.unique.island)
end

puts 'Creating characters..'
10.times do
  Character.create!(
    en_name: Faker::JapaneseMedia::OnePiece.unique.character,
    jp_name: Faker::JapaneseMedia::OnePiece.unique.location,
    epithet: Faker::JapaneseMedia::OnePiece.unique.quote,
    bounty: rand(5000..50_000_000),
    devil_fruit_id: DevilFruit.pluck(:id).sample,
    pirate_crew_id: PirateCrew.pluck(:id).sample
  )
end

puts 'Done :D'
