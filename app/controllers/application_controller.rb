class ApplicationController < ActionController::Base

    protect_from_forgery
layout "main"
    
    helper_method :forum_list
    helper_method :format_datetime
    helper_method :author_link
    def forum_list
        return Forum.all
    end
    
    def format_datetime(datetime)
        return datetime.strftime("%-m/%-d/%Y")
    end
    
    def author_link(obj)
      if(obj.respond_to?(:author) && obj.respond_to?(:user_id))
        html = "<a href="+url_for(action:"view", controller:"users", id:obj.user_id)+">"+obj.author+"</a>"
        return html.html_safe
      end
    end
    
    #authlogic 
    helper_method :current_user_session, :current_user
    
     private
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
    end

    def require_user
      require_boolean(current_user, "You must be logged in to access this page")
    end
    
    def require_admin
     require_boolean(current_user.admin?, "You must be an admin in to access this page")
    end


  def require_boolean(bool, message)
      logger.debug "ApplicationController::require_user"
      unless bool
        store_location
        flash[:notice] = message
        redirect_to splash_url #new_user_session_url
        return false
      end
  end
    
    def require_no_user
      logger.debug "ApplicationController::require_no_user"
      if current_user
        store_location
        flash[:notice] = "You must be logged out to access this page"
       # redirect_to home_index_path
        return false
      end
    end
    
    # TODO :
    def error_handler
      flash[:notice] = "Something went wrong here..."
    end

    def store_location
      #session[:return_to] = request.request_uri
    end

    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end
    
   
end