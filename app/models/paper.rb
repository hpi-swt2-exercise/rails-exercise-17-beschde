class Paper < ActiveRecord::Base
  validates :title, presence: true
  validates :venue, presence: true
  validates :year, presence: true, numericality: {
    only_integer: true, greater_than_or_equal_to: 0
  }
end
