get '/questions/:id/answer/new' do
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
