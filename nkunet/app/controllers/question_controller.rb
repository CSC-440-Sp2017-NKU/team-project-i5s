class QuestionController < ActionController::Base
    layout "main"
    require "test_data"
    include TestData
    helper TestData
    
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def view_question
      @question = list_questions()[Integer(params["id"])]
  end
  
end


  class Question
    attr_accessor :id, :forum, :title, :author, :created_on, :num_answers, :description, :answers
  end

  class Forum
    attr_accessor :name, :id, :image
  end

class Answer
end