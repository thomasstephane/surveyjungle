get '/' do
  @user = current_user
  erb :index
end


post '/survey' do
  open = params[:open] == "true"

  @survey = Survey.create(
    title: params[:title],
    description: params[:description],
    user_id: session[:user_id], open: open)
  @questions = params[:questions]
  p @questions
  if @survey.title != "" && @questions != [{"question"=>"", "choices"=>[""]}]
    @questions.each do |question|
      @question_value = question["question"]
      @question = Question.create(question: @question_value) if @question_value != "" && @question_value != nil
      @choices = question["choices"]
      @choices.each do |choice|
        @question.choices.create(choice: choice)  if choice != "" && choice != nil
      end
      if @question.choices.length == 0
        @question.destroy
      else
        @survey.questions << @question
      end
    end
    if @survey.questions.length != 0
      redirect "/share/#{@survey.id}"
    else
      @survey.destroy
      redirect "/"
    end
else
  redirect "/"
end
end

get '/survey' do
  @user = current_user
  erb :survey
end


get '/register' do
  @user = current_user
  erb :register
end