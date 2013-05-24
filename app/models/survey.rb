class Survey < ActiveRecord::Base
  belongs_to :user
  has_many :participations
  has_many :questions
  has_many :users, through: :participations
  has_many :choices, through: :questions

  validates :title, presence: true
end
