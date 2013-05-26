get '/' do
  

  erb :index
end


post '/survey' do
  @survey = Survey.create(
    title: params[:title],
    description: params[:description])

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
 

  erb :survey
end
