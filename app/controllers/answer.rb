get '/questions/:id/answers/new' do
  @question= Question.find(params[:id])
  erb :'/answers/create'
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
