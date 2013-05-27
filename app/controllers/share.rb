get '/share' do 
  @user = current_user
  @surveys = Survey.where("user_id = ?",session[:user_id])
  erb :share
end

get '/share/:survey_id' do |survey_id| 
  @user = current_user
  @survey = Survey.find(survey_id)
  erb :share_survey
end

post '/share/:survey_id' do |survey_id|
  @user = current_user
  params["survey"]["emails"].each do |email|
    invity = User.find_by_email(email)
    if invity
      Participation.create(invited: "invited", survey_id: survey_id, user_id: invity.id)
    else
      Invitation.create(invited_email: email, survey_id: survey_id, user_id: @user.id)
      send_mail(email)
    end
  end
  redirect '/'
end

def send_mail(email)
  Pony.mail({
    :to => email,
    :via => :smtp,
    :via_options => {
      :address              => 'smtp.gmail.com',
      :port                 => '587',
      :enable_starttls_auto => true,
      :user_name            => ENV["username"],
      :password             => ENV["password"],
      :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
      :domain               => "localhost.localdomain" # the HELO domain provided by the client to the server
    }
  })
end