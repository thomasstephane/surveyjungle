class Survey < ActiveRecord::Base
  belongs_to :user
  has_many :participations
  has_many :invitations
  has_many :questions
  has_many :users, through: :invitations
  has_many :users, through: :participations
  has_many :choices, through: :questions

  validates :title, presence: true

  def nb_participations
    self.participations.where("invited <> 'invited'").count
  end
end
