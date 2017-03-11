class ApplicationController < ActionController::Base
layout "main"
    require "test_data"
    include TestData
    helper TestData
    
    helper_method :forum_list
    
    def forum_list
       return test_list_forums() 
    end
end