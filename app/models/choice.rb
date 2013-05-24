class Choice < ActiveRecord::Base
  belongs_to :question
  has_many :responses
  has_many :users, through: :responses
end
