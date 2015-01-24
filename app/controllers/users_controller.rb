class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
 
 helper_method :getuserid
 
 def getuserid
   @getuserid = User.find(params[:id])
 end
   
  def index
    @users = User.all
   #redirect_to root_path, :notice => "log in admin"
  end

  def show
    @user = User.find(params[:id])
    @is_admin = current_user && current_user.id==@user.id
  end

  def new
    if current_user
      redirect_to root_path, :notice=> "you already registered"
    end
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
    if current_user.id != @user.id  
      redirect_to @user
    end
  end

 
  def create
    @user = User.new(user_params)
    
    if @user.save
       session[:user_id] = @user.id
       redirect_to @user, :notice=> 'User was successfully created'
     else 
       render action: "new"
     end
 end   
  
 
 
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Buddy was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
 

  
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end