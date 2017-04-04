class QaController < ApplicationController
  
  # TODO : impelement visibility check -- if not visible, don't render.
  #GET -- return question/answers objects
  def view_question
    if (!params[:id].nil?)
      id = Integer(params[:id])
      @question = Question.find(id) # return the question object
      #@answers = Question.answers # return the associated answers
    else
      #render 'forum/index'
     # redirect_to controller:"application", action:"error_handler", "This is not a good question."
    end
    #comment
  end

  # TODO : impelement visibility check -- if not visible, don't render.
  #POST -- write the data written in the form to the db
  #GET --  return the form to write a question
  def post_question
    if request.post?
      @question = Question.new(question_params)
 
      if @question.save
        redirect_to controller:"forum", action:"view_forum", id:@question.forum_id
      else
        render 'post_question'
      end
    else
      @forum_id =Integer(params["forum_id"])
    end
  end
  
  # TODO : impelement visibility check -- if not visible, don't render.
  def answer_question
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
  
  
  # TODO : impelement visibility check -- if not visible, don't render.
  # allows a user to edit the question
  # change text, change title :: user has to be admin!
  # check for POST/GET request sent in
  # GET : input: question_id, returns the question form
  # POST : input: Question object fed in from the view, output: redirect to view the question
  def edit_question
    #require_admin
    if request.post? # pass in the entire object you want to edit
      #over-write the data of the existing question
      #title, text, etc.
      #lookup the existing object in the db, edit the values, and save it.
      @question = Question.find(edit_question_params.id) #inbound data object with the 3 params
      @question.title = edit_question_params.title
      @question.text = edit_question_params.text
      @question.save() # save the db!
      
      #send the user back to the view_question with hte question id we just saved
      redirect_to controller:"qa", action:"view_question", id:@question.id
      #returns the form
    else # handles the get request which is to return a single question
      @question = Question.find(Integer(params["id"]))
    end
  end
  
  # TODO : 
  # allows a user to edit the answer
  # change text, change title :: user has to be admin!
  # check for POST/GET request sent in
  # GET : input: answer_id, returns the answer form
  # POST : input: Answer object fed in from the view, output: redirect to view the question
  def edit_answer
    @answer = Answer.find(edit_answer_params.id) #inbound data object with 2 params(possibly 3 if we need to include question id)
    @answer.text = edit_answer_params.text
    @answer.save() #save to the db
    #@answer.questionId = edit_question_params.questionId
  end
  
  
  # TODO : 
  # add to routes
  # implement
  def delete_question
    if request.post?
      # set the question visible flag to false
      @question.visible = false
    end

  end
  
  
  # TODO : 
  # add to routes
  # impelement
  def delete_answer
    if request.post?
      # set the question visible flag to false
      @answer.isVisible = false
    end
    
  end
  
  
  # TODO :
  #add to routes,
  #implemenet
  #hunter using AJAX
  def vote
  
  end
  
  
  
  
  
 
  
private
    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:text, :title, :user_id, :forum_id)
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def edit_question_params
      params.require(:question).permit(:text, :title, :id)
    end
    
    def answer_params
      params.require(:answer).permit(:text, :user_id, :question_id)
    end
end
