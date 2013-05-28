['/participation/:survey_id', '/survey/:survey_id', '/survey', '/share/:survey_id', '/share', '/analyze', '/answer'].each do |path|
  before path do 
    redirect '/register' unless session[:user_id]
  end
end

get '/participation/:survey_id' do |survey_id|
  @user = current_user
  @survey = Survey.find(survey_id.to_i)
  particip = Participation.find_by_user_id_and_survey_id(@user.id, @survey.id)
  if particip
    erb :survey_display
  else
    erb :survey_answer
  end
end

post '/survey/:survey_id/participation' do |survey_id|
  @user = current_user
  @survey = Survey.find(survey_id)
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
  @surveys = Survey.where("user_id = ? OR open = ?",session[:user_id], true)
  @participations = Participation.where("user_id = ? AND invited = ?",@user.id, "responded")
  @participations.each do |participation|
    @surveys << Survey.find(participation.survey_id)
  end
  @surveys.uniq!
  erb :analyze
end

get '/answer' do 
  @user = current_user
  puts " participation -----------------------"
  p @participations = Participation.where("user_id = ? AND invited = ?",@user.id, "invited")
  puts "done participation -----------------------"
  p @already_done = Participation.where("user_id = ? AND invited = ?",@user.id, "responded")
  @survey_done = []
  if @already_done
    @already_done.each do |participation|
      @survey_done << Survey.find(participation.survey_id)
    end
  end
  @surveys = Survey.where("open = ?", true)
  @participations.each do |participation|
    @surveys << Survey.find(participation.survey_id)
  end
  puts " final -----------------------"
  p @surveys
  puts " final -----------------------"
  p @surveys = @surveys.uniq - @survey_done
  erb :answer
end
