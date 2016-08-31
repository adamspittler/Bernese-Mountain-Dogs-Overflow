get '/questions' do
  @questions = Question.all
  erb :'index'
end

get '/questions/new' do
  erb :'questions/new'
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

put '/questions/:id' do
  halt(404, erb(:'404')) unless login?

  @question.assign_attributes(params[:questions])

  if @question.save
    redirect "entries/#{@question.id}"
  else
    @errors = @question.errors.full_messages
    erb :'questions/edit'
  end
end

delete '/questions/:id' do
  halt(404, erb(:'404')) unless login?

  @question.destroy
  redirect '/question'
end
