class DevilFruit < ApplicationRecord
  include PgSearch::Model
  multisearchable against: %i[name power_type]

  has_many :characters

  validates :name, presence: true, uniqueness: true

  before_save :format_name

  private

  def format_name
    self.name = name.split.map(&:capitalize).join(' ')
  end
end
