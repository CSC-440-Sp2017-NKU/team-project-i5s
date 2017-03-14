class QaController < ApplicationController
  
  #GET -- return question/answers objects
  def view_question
    if (!params[:id].nil?)
      id = Integer(param[:id])
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
      @question = Question.new(qa_params)
 
      if @question.save
        redirect_to @question
      else
        render 'post_question'
      end
    else
      @forum_id =Integer(params["forum_id"])
    end
  end
 
  
private

    # Never trust parameters from the scary internet, only allow the white list through.
    def qa_params
      params.require(:question).permit(:question_description, :question_title, :user_id, :forum_id)
    end
end
