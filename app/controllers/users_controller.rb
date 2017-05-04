class UsersController < ApplicationController
  #TODO: <CLINT> : properly add user control  

  def new
    @user = User.new
    @message = flash[:notice]
  end

  def create
    
    @user = User.new(user_params)
    # Saving without session maintenance to skip
    # auto-login which can't happen here because
    # the User has not yet been activated
    if @user.save
      flash[:notice] = "User account "+@user.user_name+" has been created."
      redirect_to signup_url
    else
      flash[:notice] = "There was a problem creating this user."
      render :action => :new
    end

  end

  def show
    @user = current_user
     # def show from attachment upload tutorial https://matt.berther.io/2007/10/19/uploading-files-to-a-database-using-rails/
    #if UserFile.where(user_id: current_user.id).count>0
      #@user_file = UserFile.find(params[:id])
      #send_data @user_file.data, :filename => @user_file.filename, :type => @user_file.content_type
    #end
 # end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to account_url
    else
      render :action => :edit
    end
  end
  

  #the user page!
  #GET -- accepts user_id only !! 
  #todo: add to routes, implement function
  #create a view file under 
  #/users/view.html.erb
  #update routes
  def view
    require_user
    @meesage = flash[:notice]
    #@question = User.find(Integer(params["id"]))
    if (!params[:id].nil?)
      id = Integer(params[:id])
     return @user = User.find(id) # return the user object
     # @user_file = UserFile.where(user_id: id) if UserFile.where(user_id: id).count>0
     # return @user + @user_file 
    else
      #trying to view a user page without a user-id
      #to be done -- this is an error state, just display an error message
     # redirect_to controller:"qa", action:"view_question", id:@question.id
      #render 'forum/index'
    end
  end
  
  #TODO: <DOUG> : handle an upload resource post request
  #https://matt.berther.io/2007/10/19/uploading-files-to-a-database-using-rails/
  def upload_user_file
    
    #return if params[:attached_file].blank?
    
    @user_file = UserFile.new
    
    #if  upload_user_file_params[:resource_text].nil
     # @user_file.resource_text = upload_user_file_params[:resource_text]
    #else
    @user_file.resource_text = upload_user_file_params[:attached_file].original_filename
      
    #end
    @user_file.uploaded_file = upload_user_file_params[:attached_file]
    @user_file.user_id = current_user.id
    #if  !upload_user_file_params[:resource_text].nil?
     # @user_file.resource_text = upload_user_file_params[:resource_text]
    #end
    if @user_file.save
        flash[:notice] = "Thank you for your submission..."
        redirect_to :action => "view", :id =>current_user.id
    else
        flash[:error] = "There was a problem submitting your attachment."
        redirect_to :action => "view", :id =>current_user.id
        #render :action => "new"
    end

    #on complete, redirect back to current user's page
  end
  
  #TODO: <DOUG> : delete selected resource
  def delete_user_file
    id = Integer(params["id"])
    require_boolean current_user.id == UserFile.find(id).user_id
    UserFile.delete(id)
    redirect_to :action => "view", :id =>current_user.id
  
  end
  
  def download_file
    item = UserFile.find(Integer(params["id"]))
    send_data item.attached_file, filename: item.resource_text, disposition: 'attachment' #can use 'type' parameter
  end
  
  
  #handled by route
  def registrar_form
    require_manager
    #@message = flash[:notice]
  end
  
  #implement the upload feature
  def handle_upload
    require_manager
  
    Upload.upload( params[:file] )

    flash[:notice] = "Upload success."
    redirect_to action:"registrar_form"

  end
  
  #list all of the users in the system for hte admin...
  def list
    require_admin
    @Users = User.all
  end
  
  
  private
  def user_params
    params.require(:user).permit(:user_name, :email, :password, :password_confirmation, :role_id)
  end
  
  #TODO: <DOUG> : pull file data from params
  def upload_user_file_params
    params.require(:file).permit(:attached_file)
  end
  
  def upload_registrar_params
    params.require(:file).original_filename
  end
end
