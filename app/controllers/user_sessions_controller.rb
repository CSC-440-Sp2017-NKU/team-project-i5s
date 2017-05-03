class UserSessionsController < ApplicationController 
  before_filter :require_user, :only => :destroy

  def index
    redirect_to :action => :splash
  end

  def new
    @user_session = UserSession.new
  end

  def splash
    @user_session = UserSession.new
    @message = flash[:notice]
    respond_to do |format|
      format.html {render :layout => 'splash'}
    end
  end

  def create
    @user_session = UserSession.new(user_session_params)
    if @user_session.save
      flash[:notice] = "Login successful!"
     # redirect_back_or_default account_url(@current_user)
        redirect_to(action:"index", controller:"forum")
    else
      render :action => :splash
    end
  end
  
  #hacky fix for logout link, fix properly for iter3
  before_action :destroy, only: [:show]
  def show
    
  end
  
  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_to action:"splash"
  end

private
  def user_session_params
    params.require(:user_session).permit(:email, :password, :remember_me)
    
  end
end
