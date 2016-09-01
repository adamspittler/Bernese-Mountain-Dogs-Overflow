get '/questions' do
  @questions = Question.all
  erb :'index'
end

get '/questions/new' do
  if current_user
    erb :'questions/new'
  else
    redirect '/users/login'
  end
end

post '/questions' do
  @question = Question.new(params[:question])
  if @question.save
    redirect '/questions'
  else
    @errors = ["Please enter title and body text"]
    erb :'questions/new'
  end
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'questions/show'
end

get '/questions/:id/edit' do
  #get params from url
  @question = Question.find(params[:id]) #define intstance variable for view
  erb :'questions/edit' #show edit question view
end

get '/questions/:id/answers/new' do
  @question= Question.find(params[:id])
  erb :'/answers/create'
end

get '/questions/:id/upvote' do
  vote= Vote.create(user_id: current_user.id, value: 1, votable_type: "Question", votable_id: params[:id])
  redirect "/questions/#{params[:id]}"
end

get '/questions/:id/downvote' do
  vote= Vote.create(user_id: current_user.id, value: -1, votable_type: "Question", votable_id: params[:id])
  redirect "/questions/#{params[:id]}"
end

put '/questions/:id' do
  halt(404, erb(:'404')) unless login?
  # binding.pry
  @question = Question.find(params[:id])
  @question.assign_attributes(params[:question])

  if @question.save
    redirect "questions/#{@question.id}"
  else
    @errors = @question.errors.full_messages
    erb :'questions/edit'
  end
end

delete '/questions/:id' do
  halt(404, erb(:'404')) unless login?
  @question = Question.find(params[:id])
  @question.destroy
  redirect '/questions'
end
