30.times do |i|
  User.create(username: "Dude#{i+1}", email: "dude#{i+1}@mail.com", password: "pass")
end

User.all.each do |user|
  num = 1 + rand(10)
  num.times do |i|
    Survey.create(title: "Survey#{i + 1}", description: "This is the description of survey number #{i + 1}", user_id: user.id) 
  end
end

Survey.all.each do |survey|
  num = 2 + rand(10)
  num.times do |i|
    Question.create(survey_id: survey.id, question: "What do you think about this question #{i + 1}?")
  end
end

Question.all.each do |question|
  num = 2 + rand(4)
  num.times do |i|
    Choice.create(question_id: question.id, choice: "This is choice number #{i+1}")
  end
end

Survey.all.each do |survey|
  User.all.each do |user|
    invite = ["non_invited","invited", "responded"].sample
    Participation.create(user_id: user.id, survey_id: survey.id, invited: invite)
    if invite != "invited"
      survey.questions.each do |question|
        Response.create(choice_id: question.choices.sample.id, question_id: question.id, user_id: user.id)
      end
    end
  end
end