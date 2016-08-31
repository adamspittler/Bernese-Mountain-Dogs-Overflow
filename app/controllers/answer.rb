get '/questions/:id/answers/new' do
  @question= Question.find(params[:id])
  if current_user && current_user.id != @question.user_id
    erb :'/answers/create'
  elsif current_user
    redirect '/questions'
  else
    redirect 'users/login'
  end
end

post '/answers' do
  answer=Answer.new(params[:answer])
  if answer.save
    redirect '/'
  else
    @error=answer.errors.full_messages
    erb :'/answers/create'
  end
end

get '/answers/:id/edit' do
  require_user
  @answer= Answer.find(params[:id])
  erb :'/answers/edit'
end
