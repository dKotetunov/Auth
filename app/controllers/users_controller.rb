class UsersController < ApplicationController
  
  def index
    @user = User.all
  end
  
  def new
  	  @user = User.new
      @profile = Profile.new
  end

  def edit
    @user = User.find(params[:id])
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html {redirect_to edit_user_path, notice: "User info was changed"}
        format.js{}
      else
        format.html{render action: "edit"}
      end
    end
  end
  

  def show
    @user = User.find(params[:id])
  end

  def create
  	@user = User.new(params[:user])
  	if @user.valid? && @user.save
   		    @user.create_profile
          redirect_to log_in_path, :notice => "Signed"
  	else
  		    render "new"
  	end

    

  end
end
