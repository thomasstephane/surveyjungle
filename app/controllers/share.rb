get '/share' do 
  @user = current_user
  @surveys = Survey.where("user_id = ?",session[:user_id])
  erb :share
end

get '/share/:survey_id' do |survey_id| 
  @user = current_user
  @survey = Survey.find(survey_id)
  erb :share_survey
end

post '/share/:survey_id' do |survey_id|
  @user = current_user
  params["survey"]["emails"].each do |email|
    invity = User.find_by_email(email)
    if invity
      Participation.create(invited: "invited", survey_id: survey_id, user_id: invity.id)
    else
      Invitation.create(invited_email: email, survey_id: survey_id, user_id: @user.id)
    end
  end
  redirect '/'
end