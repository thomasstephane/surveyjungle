
get '/participation/:survey_id' do |survey_id|
  @survey = Survey.find(survey_id.to_i)
  @user = current_user
  erb :survey_answer
end

post '/survey/:survey_id/participation' do |survey_id|
  @survey = Survey.find(survey_id)
  @user = User.find(session[:user_id])
  particip = Participation.find_by_user_id_and_survey_id(@user.id, @survey.id)
  if particip
    particip.invited = "responded"
    particip.save
  else
    puts "create a responded"
    Participation.create(user_id: @user.id, survey_id: @survey.id, invited: "responded")
  end
  "#{survey_id}"
end

get '/survey/:survey_id' do |survey_id|
  @user = current_user
  @survey = Survey.find(survey_id.to_i)
  erb :survey_display
end

post '/response/:choice_id' do |choice_id|
  choice = Choice.find(choice_id)
  @user = User.find(session[:user_id])
  Response.create(choice_id: choice_id, question_id: choice.question_id, user_id: @user.id)
end

get '/analyze' do 

  @user = current_user
  @surveys = Survey.where("user_id = ?",session[:user_id])
  @participations = Participation.where("user_id = ? AND invited <> ?",@user.id, "invited")
  @participations.each do |participation|
    @surveys << Survey.find(participation.survey_id)
  end
  @surveys.uniq!
  erb :analyze
end

get '/answer' do 

  @user = current_user
  @participations = Participation.where("user_id = ? AND invited = ?",@user.id, "invited")
  @surveys = []
  @participations.each do |participation|
    @surveys << Survey.find(participation.survey_id)
  end
  @surveys.uniq!
  erb :answer
end
