class ForumController < ActionController::Base
    layout "main"
    require "test_data"
    include TestData
    helper TestData
    
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def index
    
    @popQs = list_questions()
    
  end
  
  
  
  def view_forum
      @forum = list_forums()[Integer(params["id"])]
      @questions = list_questions()
  end
  
end

  class Question
    attr_accessor :id, :forum, :title, :author, :created_on, :num_answers
   end

  class Forum
    attr_accessor :name, :id, :image
  end
