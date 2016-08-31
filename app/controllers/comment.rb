get '/questions/:id/comment/new' do
  @question= Question.find(params[:id])
  erb :'/questions/comment'
end

get '/answers/:id/comment/new' do
  @answer= Answer.find(params[:id])
  erb :'/answers/comment'
end
