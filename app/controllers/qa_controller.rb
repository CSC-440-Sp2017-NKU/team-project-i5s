class QaController < ApplicationController
  
  #GET -- return question/answers objects
  def view_question
    @question = Question.find(params[:id]) # return the question object
    @answers = Answer.find_by(question_id: params[:id]) # return the associated answers
  end
  
  #POST -- write a question to the db
  def post_question
    if request.post? # we would like to add a NEW question to the current forum.
      f_id = params[:forum_id]
      s_text = params[:forum_id]
      #redirect_to ({controller:"forum",action:"view_forum", id:Integer(params["forum"])})
    else
      @forum_id = Integer(params["forum_id"])
    end
  end
  
  
private

    # Never trust parameters from the scary internet, only allow the white list through.
    def qa_params
      params.require(:question).permit(:question_description, :question_title, :user_id, :forum_id)
    end
end
