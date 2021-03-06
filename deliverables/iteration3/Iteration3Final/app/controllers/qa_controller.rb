class QaController < ApplicationController
  #TODO: <CLINT> : properly add user control implement visibility check -- if not visible, don't render.
  
  
  #GET -- return question/answers objects
  def view_question
    require_user
    if (!params[:id].nil?)
      id = Integer(params[:id])
      @question = Question.find(id) # return the question object
      #@answers = Question.answers # return the associated answers
    else
      #render 'forum/index'
      redirect_to controller:"application", action:"error_handler", message:"This is not a good question."
    end
    #comment
  end

  #POST -- write the data written in the form to the db
  #GET --  return the form to write a question
  def post_question
    require_user
   
     
    if request.post?
     
      @question = Question.new(question_params)
      #byebug
      if @question.save
        redirect_to controller:"forum", action:"view_forum", id:@question.forum_id
      else
         @error = "Error. Question failed to post."
        
         @forum_id = Integer( question_params["forum_id"])
         
         render 'post_question'
      end
    else
      @forum_id =Integer(params["forum_id"])
    end
  end
  
  def answer_question
    require_user
    if request.post?
      @answer = Answer.new(answer_params)
      if @answer.save
        redirect_to controller:"qa", action:"view_question", id:@answer.question_id
      else
         @question = Question.find(@answer.question_id)
        render 'answer_question'
      end
    else
      @question = Question.find(Integer(params["question_id"]))
    end
    
  end
  
  # allows a user to edit the question
  # change text, change title :: user has to be admin!
  # check for POST/GET request sent in
  # GET : input: question_id, returns the question form
  # POST : input: Question object fed in from the view, output: redirect to view the question
  def edit_question
    require_admin
    if request.post? # pass in the entire object you want to edit
      #over-write the data of the existing question
      #title, text, etc.
      #lookup the existing object in the db, edit the values, and save it.
   
      @question = Question.find(edit_question_params[:id]) #inbound data object with the 3 params
      @question.title = edit_question_params[:title]
      @question.text = edit_question_params[:text]
      @question.forum_id = edit_question_params[:forum_id]
      @question.keywords = edit_question_params[:keywords]
      @question.save() # save the db!
      
      #send the user back to the view_question with hte question id we just saved
      redirect_to controller:"qa", action:"view_question", id:@question.id
      #returns the form
    else # handles the get request which is to return a single question
      @question = Question.find(Integer(params["id"]))
    end
  end
  
  # allows a user to edit the answer
  # change text, change title :: user has to be admin!
  # check for POST/GET request sent in
  # GET : input: answer_id, returns the answer form
  # POST : input: Answer object fed in from the view, output: redirect to view the question
  def edit_answer
    require_admin
    if request.post?
    @answer = Answer.find(edit_answer_params[:id]) #inbound data object with 2 params(possibly 3 if we need to include question id)
    @answer.text = edit_answer_params[:text]
    @answer.save() #save to the db
    #@answer.questionId = edit_question_params.questionId
    redirect_to controller:"qa", action:"view_question", id:@answer.question_id
    
  else
    @answer = Answer.find(Integer(params["id"]))
    end
  end
  
  def delete_question
    require_admin
      # set the question visible flag to false
      @question = Question.find Integer(params["id"])
      @question.active = false
      @question.save
      
      #cascade deactivate to answers for this question
      Answer.where(question_id: @question.id).update_all(active: false)
      
      redirect_to action: "view_forum", controller: "forum", id: @question.forum_id
      #@questions = Question.where column: "isVisible"
  end
  

  def delete_answer
    require_admin
    # set the question visible flag to false
    @answer= Answer.find Integer(params["id"])
    @answer.active = false
    @answer.save
    redirect_to action:"view_question", controller: "qa", id: @answer.question_id
    #@answers = Answer.where column: "isVisible"
  end
  
  
  def vote
    answer_id = Integer(params["answer_id"])
    dir= Integer(params["direction"])
    answer = Answer.find(answer_id)
    user_vote = answer.user_vote current_user
    
    #if curent_user has voted, update vote
    if user_vote
      user_vote.direction = dir
      user_vote.save
    else #otherwise, create a new vote
      user_vote = Vote.new
      user_vote.user_id = current_user.id
      user_vote.answers_id = answer_id
      user_vote.direction = dir
      user_vote.save
    end
    
    score = {"score" => answer.score}
    respond_to do |format|
      format.html
      format.json {render json: score}
    end
  end
  
  
  
  
  
 
  
private
    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:text, :title, :user_id, :forum_id, :keywords)
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def edit_question_params
      params.require(:question).permit(:text, :title, :id, :forum_id, :keywords)
    end
    
    def answer_params
      params.require(:answer).permit(:text, :user_id, :question_id)
    end
    
    def edit_answer_params
      params.require(:answer).permit(:text, :id)
    end
end
