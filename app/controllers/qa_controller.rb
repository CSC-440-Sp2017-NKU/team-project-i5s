class QaController < ApplicationController
  
  #GET -- return question/answers objects
  def view_question
    if (!params[:id].nil?)
      id = Integer(params[:id])
      @question = Question.find(id) # return the question object
      #@answers = Question.answers # return the associated answers
    else
      render 'forum/index'
    end
    #comment
  end

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
 
  
private
    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:text, :title, :user_id, :forum_id)
    end
    
    def answer_params
      params.require(:answer).permit(:text, :user_id, :question_id)
    end
end
