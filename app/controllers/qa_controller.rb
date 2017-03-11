require "test_classes"

class QaController < ApplicationController

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def view_question
      @question = test_list_questions()[Integer(params["id"])]
      @answers = test_list_answers()
  end
  
  def post_question
    if request.post?
      redirect_to ({controller:"forum",action:"view_forum", id:Integer(params["forum"])})
    else
    @forum_id = Integer(params["forum_id"])
    end
  end
  
  def answer_question
    if request.post?
      redirect_to ({controller:"qa",action:"view_question", id:Integer(params["question_id"])})
    else
      @question = test_list_questions()[Integer(params["question_id"])]
    end
  end
  
end

