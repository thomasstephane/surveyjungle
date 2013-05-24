class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :choices
  has_many :responses

  def nb_participations
    Survey.find(self.survey_id).nb_participations
  end
end
