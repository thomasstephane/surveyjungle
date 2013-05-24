class Survey < ActiveRecord::Base
  belongs_to :user
  has_many :participations
  has_many :questions

  validates :title, presence: true
end
