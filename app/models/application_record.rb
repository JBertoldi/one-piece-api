class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  before_validation :strip_details

  private

  def strip_details
    attributes.map do |_attr, val|
      val.strip! if val.instance_of?(String)
    end
  end
end
