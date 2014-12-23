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

    if @user.update_attributes(params[:user])
        flash[:succsess] = "Edit user"
        redirect_to user_profile_path(@user)
    
  else
    render 'edit'
  end
  
  end
  

  def show
    @user = User.find(params[:id])
  end

  def create
  	@user = User.new(params[:user])
  	if @user.valid? && @user.save
          #UserMailer.registration_confirmation(@user).deliver!
  		    @user.create_profile
          redirect_to log_in_path, :notice => "Signed"
  	else
  		render "new"
  	end

    

  end
end
