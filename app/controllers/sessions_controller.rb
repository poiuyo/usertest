class SessionsController < ApplicationController
  def new
  end
  
  def create
     user = user.authenticate params[:email], params[:password]
     if user
       session[:user_id] = user.id
       redirect_to root_path, :notice=> "Wecome back"
     else
       redirect_to :login, :alert=>"Invalid email or password dufus"
     end
  end
  
  def destroy
    session[:user_id]=nil
    redirect_to root_path, :notice=>"you have been logged out" 
  end
  
end
