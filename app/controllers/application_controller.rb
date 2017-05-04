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
    
  # ~~~~~~~~~~~~~~~~~~~~~~~~~~~ SEARCH ~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
  #<CLINT> : search_form : implement search form -- returns the form
  # GET -- retuns the form
  # POST - queries the DB, etc.
  def search_form
    #this is finsihed!!
  end
  
  #: <CLINT> : search_result : implement the actual search!
  #post -> bundles the data into a Search object the user specified
  #sends the hash of the Search object back to the DB to build
  #the query
  def search_result
    # user specified that they want to search questions?
    # user specified that they want to search courses ?

    if params[:search_for] == "question"
      if !search_params["question_keyword"].nil? and search_params["question_keyword"].include?(',')
        search_params["question_keyword"] = search_params["question_keyword"].tr(',', '').strip #scrub any commas in our search
      end

      @results = Search.search_questions(search_params.to_h)
       
    elsif params[:search_for] == "course"
      @results = Search.search_courses(search_params.to_h)
    end

  end
  # ~~~~~~~~~~~~~~~~~~~~~~~~~~~ END SEARCH ~~~~~~~~~~~~~~~~~~~~~~~ 
    
    
    
private
  def search_params
    params.require(:search).permit(:question_text, :question_title, :question_user_name, :question_keyword, :course_name, :course_instructor_name)
  end

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
  
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end

  def require_user(no_message = false)
    if(no_message)
      require_boolean(current_user)
    else
      require_boolean(current_user, "You must be logged in to access this page")
    end 
  end
  
  def require_admin
   require_boolean(current_user&.admin?, "You must be an admin to access this page")
  end
  
  def require_manager
    require_boolean(current_user&.admin? || current_user&.registrar? , "You must be an admin or a registrar to access this page")
  end

  def require_boolean(bool, message=nil)
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
  
  # TODO : implement error page
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