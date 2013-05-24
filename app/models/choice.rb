class Choice < ActiveRecord::Base
  belongs_to :question
  has_many :responses
  has_many :users, through: :responses

  def score
    if nb_participations != 0
      ((nb_responses.to_f / nb_participations.to_f) * 100).to_i
    else
      nil
    end
  end

  def nb_responses
    puts "nb responses"
    p self.responses.count
  end

  def nb_participations
    puts "nb participations"
    p Question.find(self.question_id).nb_participations
  end

end
