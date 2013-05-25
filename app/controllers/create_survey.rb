post '/survey' do
  @survey = Survey.create(
    title: params[:title],
    description: params[:description])
  @question = Question.create(question: params[:question])
  p @question
  p params
  
  @choice1 = Choice.create(choice: params[:choice1])
  @choice2 = Choice.create(choice: params[:choice2])
  @choice3 = Choice.create(choice: params[:choice3])
  @choice4 = Choice.create(choice: params[:choice4])
  
  @question.choices << @choice1 << @choice2 << @choice3 << @choice4

  @survey.questions << @question
  redirect '/survey'
end

get '/survey' do

  erb :survey
end

get '/_question' do
  erb :_question
end


