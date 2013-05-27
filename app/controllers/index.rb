get '/' do
  @user = current_user
  erb :index
end


post '/survey' do
  @survey = Survey.create(
    title: params[:title],
    description: params[:description],
    user_id: session[:user_id])

  @questions = params[:questions]
  @questions.each do |question|
    @question_value = question["question"]
    @question = Question.create(question: @question_value)
    @choices = question["choices"]
    @choices.each do |choice|
      @question.choices.create(choice: choice)
    end
    @survey.questions << @question
  end

  redirect '/survey'
end

get '/survey' do
  @user = current_user
  erb :survey
end


get '/register' do
  @user = current_user
  erb :register
end