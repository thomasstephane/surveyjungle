post '/signup' do 
  content_type :json
  if User.find_by_username(params[:username])
    {msg: "Username already taken"}.to_json
  elsif User.find_by_email(params[:email])
    {msg: "Email already taken"}.to_json
  else
    @user = User.create(username: params[:username], email: params[:email], password: session[:password])
    session[:user_id] = @user.id
    {msg: "Welcome in!"}.to_json
  end
end

post '/signin' do 
  content_type :json
  @user = User.find_by_username(params[:username])
  if session[:user_id]
    {msg: "logged in already!"}.to_json
  elsif @user
    if @user.password == params[:password]
      session[:user_id] = @user.id
      {msg: "logged in!"}.to_json
    else
      {msg: "wrong password"}.to_json
    end
  else
    {msg: "wrong username!"}.to_json
  end
end

get '/logout' do
  session.clear
  redirect '/'
end