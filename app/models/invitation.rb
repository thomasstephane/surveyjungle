class Invitation < ActiveRecord::Base
  belongs_to :user
  belongs_to :survey

  def self.add_participations(user)
    invitations = Invitation.where("invited_email = ?", user.email)
    if invitations
      invitations.each do |invit|
        Participation.create(invited: "invited", survey_id: invit.survey_id, user_id: user.id)
      end
    end
  end
end