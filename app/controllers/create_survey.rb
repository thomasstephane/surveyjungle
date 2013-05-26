
# post '/survey' do
#   survey = Survey.create(
#     title: params[:title],
#     description: params[:description])
#   @questions = params[:questions]
#   @questions.each do |question|
#     @question = Question.create(question: question[:question])
#     p @question
#     # @choices = question[choices]
#     # @choices.each do |choice|
#     #   @question.choices.create(choice: choice)
#     #   p @question.choices
#     # end    
#   end

#   p quest
#   # Question.create(question: params[:question])
#   # p @question
#   # p params
  
#   # @choice1 = Choice.create(choice: params[:choice1])
#   # @choice2 = Choice.create(choice: params[:choice2])
#   # @choice3 = Choice.create(choice: params[:choice3])
#   # @choice4 = Choice.create(choice: params[:choice4])
  
#   # @question.choices << @choice1 << @choice2 << @choice3 << @choice4

#   # @survey.questions << @question
#   # p params[:questions]
#   redirect '/survey'
# end

# get '/survey' do
#   p params[:questions]

#   erb :survey
# end

# get '/_question' do
#   erb :_question
# end


# <input id="choice" type="text" name="choice4" placeholder="Choice"><br>
# <input type="submit" value="Add Another Choice">
