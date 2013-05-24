post '/survey' do
  survey = Survey.create(
    title: params[:title],
    description: params[:description])
  question = Question.create(question: params[:question])
  
  choice1 = Choice.create(choice: params[:choice1])
  choice2 = Choice.create(choice: params[:choice2])
  choice3 = Choice.create(choice: params[:choice3])
  choice4 = Choice.create(choice: params[:choice4])
  
  question.choices << choice1 << choice2 << choice3 << choice4

  survey.questions << question

end

