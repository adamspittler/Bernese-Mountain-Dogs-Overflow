get '/users' do

  @users = User.all #define instance variable for view

  erb :'users/index' #show all users view (index)

end

get '/users/new' do

  erb :'users/new' #show new users view

end

post '/users' do
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect '/'
  else
    @errors = user.errors.full_messages
    erb :'users/new'
  end
end

get '/users/login' do
  erb :'users/login'
end

post '/users/login' do
  @user = User.find_by(username: params[:username])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = ["Incorrect username and password combination"]
    erb :"users/login"
  end
end

get '/users/logout' do
  session.clear
  redirect '/'
end

get '/users/:id' do
  @user= User.find(params[:id])
  erb :'/users/show'
end





