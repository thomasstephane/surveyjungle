get '/share' do 
  @user = current_user
  @surveys = Survey.where("user_id = ?",session[:user_id])
  erb :share
end