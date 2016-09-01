get '/questions/:id/comment/new' do
  require_user
  @question= Question.find(params[:id])
  if request.xhr?
    erb :'/questions/_question_comment_form', layout: false
  else
    erb :'/questions/_question_comment_form'
  end
end

post '/questions/:id/comment' do
  @comment= Comment.new(params[:comment])
  if @comment.save
    if request.xhr?
      erb :'_comment_display', locals: { comment: @comment }, layout: false
    else
      redirect "/questions/#{params[:id]}"
    end
  else
    @errors= @comment.errors.full_messages
    erb :'/questions/_question_comment_form'
  end
end

get '/answers/:id/comment/new' do
  require_user
  @answer= Answer.find(params[:id])
  erb :'/answers/_answer_comment_form'
end

post '/answers/:id/comment' do
  @comment= Comment.new(params[:comment])
  question_id= Answer.find(params[:id]).question.id

  if @comment.save
    redirect "/questions/#{question_id}"
  else
    @errors= @comment.errors.full_messages
    erb :'/answers/_answer_comment_form'
  end
end
