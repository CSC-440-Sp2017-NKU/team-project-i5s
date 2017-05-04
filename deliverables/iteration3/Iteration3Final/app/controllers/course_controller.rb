class CourseController < ApplicationController
    before_action :require_user
    
    #TODO : <ROBERT> : return all sections for the passed course
    def view_course
        id = Integer(params[:id])
        @course = Course.find(id)
    end
  
    #TODO : <ROBERT> : return all courses
    def list_course
      @courses = Course.all()
    end
    
    #TODO : <ROBERT> : return a section based on id
    def view_section
        id = Integer(params[:id])
        @section = Section.find(id)
    end
end