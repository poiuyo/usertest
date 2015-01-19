class SessionsController < ApplicationController
  def new
  end
  
  def create
     farmer = Farmer.authenticate params[:email], params[:password]
     if farmer
       session[:farmer_id] = farmer.id
       redirect_to root_path, :notice=> "Wecome back"
     else
       redirect_to :login, :alert=>"Invalid email or password dufus"
     end
  end
  
  def destroy
    session[:farmer_id]=nil
    redirect_to_root_path :notice=>"you have been logged out" 
  end
  
end
