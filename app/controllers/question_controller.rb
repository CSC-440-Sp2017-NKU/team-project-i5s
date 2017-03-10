require "test_classes"

class QuestionController < ApplicationController

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def view_question
      @question = test_list_questions()[Integer(params["id"])]
      @answers = test_list_answers()
  end
end

