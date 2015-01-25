class GenericController < ApplicationController
  protected
  def edit
     @user = User.find(params[:id])
  end
  
  def index
    @users = User.all
  end
  
end
