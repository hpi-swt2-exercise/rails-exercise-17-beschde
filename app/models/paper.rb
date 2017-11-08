class Paper < ActiveRecord::Base
  validates :title, presence: true
  validates :venue, presence: true
  validates :year, numericality: {
    only_integer: true, greater_than_or_equal_to: 0
  }

  scope :published_in, ->(year) { where year: year }

  has_and_belongs_to_many :authors
end
