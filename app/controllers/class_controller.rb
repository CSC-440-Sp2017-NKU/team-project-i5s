class ClassController < ApplicationController
    
     def index #needs to return the popular forums
    require_class true
    end
    
    def view_class
        require_class
      if !params[:id].nil?
        id = Integer(params[:id])
        @class = Class.find(id) #
      else
        render '??'  
      end
    end
  
    def list_class
      require_class
    end
end