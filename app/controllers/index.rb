get '/' do
  #this will eventually just redirect to /questions
  @questions= Question.all
  erb :'index'
end

