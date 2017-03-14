class ForumController < ApplicationController
    # data handled by the application_controller forum method, 
    # index function doesn't need to gather any data, but it's returning the 
    # view. 
    def index #needs to return the popular forums
     #   @forums = Forum.all
      @popular_questions = Forum.most_popular_questions # return the most recent
    end
    
    # GET -- gets passed a params oject containing
    # 'user clicks on a forum' this method handles that request
    def view_forum
      if !params[:id].nil?
        id = Integer(params[:id])
        @forum = Forum.find(id) #
      else
        render 'index'  
      end
    end
    
    # data pull handled elsewhere, returns the view
    # contains 
    def list_forums
    end
    
end
