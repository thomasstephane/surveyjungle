5.times do |i|
  User.create(username: "Dude#{i+1}", email: "dude#{i+1}@mail.com", password: "pass")
end

10.times do |i|
  Survey.create(title: "Survey#{i+1}", description: "This is the description of survey number #{i+1}", user_id: (1 + rand(5))) 
end

40.times do |i|
  Question.create(survey_id: (1+rand(10)), question: "What do you think about this question #{i+1}?")
end

150.times do |i|
  Choice.create(question_id: (1+rand(40)), choice: "This is choice number #{i+1}")
end

10.times do |i_survey|
  5.times do |i_user|
    invite = ["non_invited","invited", "responded"].sample
    Participation.create(user_id: (i_user + 1), survey_id: (i_survey + 1), invited: invite)
    if invite != "invited"
      Survey.find(i_survey + 1).questions.each do |question|
        Response.create(choice_id: question.choices.sample.id, question_id: question.id, user_id: (i_user + 1))
      end
    end
  end
end