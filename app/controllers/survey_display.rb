get '/survey/:survey_id' do |survey_id|
  @survey = Survey.find(survey_id.to_i)
  erb :survey_display
end