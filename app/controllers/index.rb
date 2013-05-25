get '/' do
  @user = current_user
  @surveys = Survey.all
  erb :index
end
