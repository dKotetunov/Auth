class ProfilesController < ApplicationController
	def show
		@user = User.find(params[:user_id])
		@profile = @user.profile
	end

	def edit
		@user = User.find(params[:user_id])
		@profile = @user.profile
	end
	
	def update
		@user = User.find(params[:user_id])
		@profile = @user.profile
		if @profile.update_attributes(params[:profile])
			#redirect_to user_profile_url(@user)
      format.html { redirect_to user_profile_path(@user), notice: 'Profile was successfully updated.' }
      format.js   {}
      format.json { render json: @user, status: :created, location: @user }
		else
		render 'edit'
	end
	
	end

end
