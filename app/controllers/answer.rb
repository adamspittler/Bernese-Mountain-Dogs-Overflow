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

put '/answers/:id' do
  halt(404, erb(:'404')) unless login?

  @answer = Answer.find(params[:id])
  @answer.assign_attributes(params[:answer])

  if @answer.save
    redirect "questions/#{@answer.question_id}"
  else
    @errors = @answer.errors.full_messages
    erb :'answers/edit'
  end
end

delete '/answers/:id' do
  require_user
  @answer = Answer.find(params[:id])
  @answer.destroy
  redirect "/questions/#{@answer.question_id}"
end
