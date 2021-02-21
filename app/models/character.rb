class Character < ApplicationRecord
  include PgSearch::Model
  multisearchable against: %i[en_name jp_name status epithet bounty]

  belongs_to :devil_fruit, optional: true
  belongs_to :pirate_crew, optional: true

  validates_presence_of :en_name, :jp_name
  validates_uniqueness_of :en_name, :jp_name, :epithet
  validates :en_name, format: { with: /\A([\p{L}.])+(\s[\p{L}.]+)*\Z/ }

  before_save :format_en_name

  private

  def format_en_name
    self.en_name = en_name.split.map(&:capitalize).join(' ')
  end
end
