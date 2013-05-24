class Response < ActiveRecord::Base
  belongs_to :question
  belongs_to :choice
  belongs_to :user
end
