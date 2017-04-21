class CourseController < ApplicationController
    before_action :require_user
    
    #TOREVIEW: return all sections for the passed course
    def view_course
        id = Integer(params[:id])
        @course = Course.find(id)
    end
  
    #TOREVIEW: return all courses
    def list_course
      @courses = Course.all()
    end
    
    #TODO: return a section based on id
    def view_section
    #Integer(params["id"])
    #@section
    end
end