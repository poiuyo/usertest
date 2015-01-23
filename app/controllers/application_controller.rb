class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_user
  
  helper_method :current_order

def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end
   
  private
  def current_user
    @current_user ||= Farmer.find(session[:farmer_id]) if session[:farmer_id]
  rescue ActiveRecord::RecordNotFound
    session[:farmer_id]=nil
  end
  
  
end
