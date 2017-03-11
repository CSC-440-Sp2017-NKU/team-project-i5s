require "test_classes"

class ForumController < ApplicationController
    
    
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def index
    @forums = test_list_forums()
    @popular_questions = test_list_questions()
  end
  
  
  
  def view_forum
      @forum = test_list_forums()[Integer(params["id"])]
      @questions = test_list_questions()
  end
  
end
