class ApplicationController < ActionController::Base
layout "main"
    #require "test_data"
    #include TestData
    #helper TestData
    
    helper_method :forum_list
    helper_method :format_datetime
    
    def forum_list
        return Forum.all
    end
    
    def format_datetime(datetime)
        return datetime.strftime("%-m/%-d/%Y")
    end
end