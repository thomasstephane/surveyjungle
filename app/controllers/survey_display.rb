get '/survey/:survey_id' do |survey_id|
  @survey = Survey.find(survey_id.to_i)
  erb :survey_display
end

get '/survey/:survey_id/participation' do |survey_id|
  @survey = Survey.find(survey_id.to_i)
  @user = User.find(session[:user_id])
  erb :survey_answer
end

post '/survey/:survey_id/participation' do |survey_id|
  @survey = Survey.find(survey_id.to_i)
  @user = User.find(session[:user_id])
  particip = Participation.find_by_user_id_and_survey_id(@user.id, @survey.id)
  if particip
    particip.invited = "responded"
  else
    Participation.create(user_id: @user.id, survey_id: @survey.id)
  end
  redirect '/'
end
