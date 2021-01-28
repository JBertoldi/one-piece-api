class Character < ApplicationRecord
  belongs_to :devil_fruit
  belongs_to :pirate_crew

  validates :en_name, :jp_name, :epithet, uniqueness: true
end
