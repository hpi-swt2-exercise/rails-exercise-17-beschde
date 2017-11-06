class Paper < ActiveRecord::Base
  validates :title, presence: true
  validates :venue, presence: true
end
